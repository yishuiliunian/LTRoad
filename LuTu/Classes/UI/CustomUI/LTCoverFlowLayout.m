//
//  LTCoverFlowLayout.m
//  LuTu
//
//  Created by stonedong on 15/4/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCoverFlowLayout.h"

@implementation LTCoverFlowLayout
#pragma mark - Init

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    
    return self;
}

#pragma mark - Overridden

- (void)prepareLayout {
    [super prepareLayout];
    
    NSAssert(self.collectionView.numberOfSections == 1, @"[YRCoverFlowLayout]: Multiple sections aren't supported!");
    NSAssert(self.scrollDirection == UICollectionViewScrollDirectionHorizontal, @"[YRCoverFlowLayout]: Vertical scrolling isn't supported!");
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    //    CGFloat xOffset = self.collectionView.contentOffset.x;
    NSArray *idxPaths = [self indexPathsContainedInRect:rect];
    //    CGRect visibleRect = (CGRect){self.collectionView.contentOffset, self.collectionView.bounds.size};
    
    //    NSLog(@"Current offset: %.2f.", xOffset);
    //    NSLog(@"Visible rect: %@. Requested rect: %@", NSStringFromCGRect(visibleRect), NSStringFromCGRect(rect));
    //    NSLog(@"Got %d items for requested rect.", (int32_t)idxPaths.count);
    
    NSMutableArray *resultingAttributes = [NSMutableArray new];
    
    for (NSIndexPath *path in idxPaths) {
        // We should create attributes by ourself.
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:path];
        
        [resultingAttributes addObject:attributes];
    }
    
    return [NSArray arrayWithArray:resultingAttributes];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.size = self.itemSize;
    attributes.center = (CGPoint){
        [self collectionViewWidth] * indexPath.row + [self collectionViewWidth],
        [self collectionViewHeight] / 2
    };
    
    [self interpolateAttributes:attributes
                      forOffset:self.collectionView.contentOffset.x];
    
    return attributes;
}

- (CGSize)collectionViewContentSize {
    return (CGSize){self.collectionView.bounds.size.width * [self.collectionView numberOfItemsInSection:0],
        self.collectionView.bounds.size.height};
}

#pragma mark - Accessors

- (CGFloat)collectionViewHeight {
    return self.collectionView.bounds.size.height;
}

- (CGFloat)collectionViewWidth {
    return self.collectionView.bounds.size.width;
}

#pragma mark - Private

- (void)commonInit {
    self.maxCoverDegree = 45.0f;
    self.coverDensity = 0.25f;
}

- (CGPoint)itemCenterForRow:(NSInteger)row {
    CGSize collectionViewSize = self.collectionView.bounds.size;
    return (CGPoint){row * collectionViewSize.width + collectionViewSize.width / 2 ,
        collectionViewSize.height / 2};
}

- (CGFloat)minXForRow:(NSInteger)row {
    return [self itemCenterForRow:row - 1].x + (1.0f / 2 - self.coverDensity) * self.itemSize.width;
}

- (CGFloat)maxXForRow:(NSInteger)row {
    return [self itemCenterForRow:row + 1].x - (1.0f / 2 - self.coverDensity) * self.itemSize.width;
}

- (CGFloat)minXCenterForRow:(NSInteger)row {
    CGFloat center = [self itemCenterForRow:row - 1].x;
    
    return center + (self.itemSize.width / 2) * (1 - 2 * self.coverDensity + cos([self degreesToRad:self.maxCoverDegree]));
}

- (CGFloat)maxXCenterForRow:(NSInteger)row {
    CGFloat center = [self itemCenterForRow:row + 1].x;
    
    return center - (self.itemSize.width / 2) * (1 - 2 * self.coverDensity + cos([self degreesToRad:self.maxCoverDegree]));
}

- (CGFloat)degreesToRad:(CGFloat)degrees {
    return degrees * M_PI / 180;
}

- (NSArray *)indexPathsContainedInRect:(CGRect)rect {
    if ([self.collectionView numberOfItemsInSection:0] == 0) {
        // Nothing to do here when we don't have items.
        return @[];
    }
    
    // Find min and max rows that can be determined for sure.
    NSInteger minRow = MAX(rect.origin.x / [self collectionViewWidth], 0);
    NSInteger maxRow = CGRectGetMaxX(rect) / [self collectionViewWidth];
    
    // Additional check for rows that also can be included (our rows are moving depending on content size).
    NSInteger candidateMinRow = MAX(minRow - 1, 0);
    if ([self maxXForRow:candidateMinRow] >= rect.origin.x) {
        // We have a row that is lesser than given minimum.
        minRow = candidateMinRow;
    }
    
    NSInteger candidateMaxRow = MIN(maxRow + 1, [self.collectionView numberOfItemsInSection:0] - 1);
    if ([self minXForRow:candidateMaxRow] <= CGRectGetMaxX(rect)) {
        maxRow = candidateMaxRow;
    }
    
    // Simply add index paths between min and max.
    NSMutableArray *resultingIdxPaths = [NSMutableArray new];
    
    for (NSInteger i = minRow; i <= maxRow; i++) {
        [resultingIdxPaths addObject:[NSIndexPath indexPathForRow:i
                                                        inSection:0]];
    }
    
    return [NSArray arrayWithArray:resultingIdxPaths];
}

- (void)interpolateAttributes:(UICollectionViewLayoutAttributes *)attributes
                    forOffset:(CGFloat)offset {
    NSIndexPath *attributesPath = attributes.indexPath;
    
    // Interpolate offset for given attribute. For this task we need min max interval and min and max x allowed for item.
    CGFloat minInterval = (attributesPath.row - 1) * [self collectionViewWidth];
    CGFloat maxInterval = (attributesPath.row + 1) * [self collectionViewWidth];
    
    CGFloat minX = [self minXCenterForRow:attributesPath.row];
    CGFloat maxX = [self maxXCenterForRow:attributesPath.row];
    
    // Interpolate by formula
    CGFloat interpolatedX = MIN(MAX(minX + (((maxX - minX) / (maxInterval - minInterval)) * (offset - minInterval)),
                                    minX),
                                maxX);
    attributes.center = (CGPoint){
        interpolatedX,
        attributes.center.y
    };
    
    // Interpolate position into angle by formula.
    CGFloat angle = -self.maxCoverDegree + (interpolatedX - minX) * 2 * self.maxCoverDegree / (maxX - minX);
    
    CATransform3D transform = CATransform3DIdentity;
    // Add perspective.
    transform.m34 = -1 / 500.0f;
    // Then rotate.
    transform = CATransform3DRotate(transform, angle * M_PI / 180, 0, 1, 0);
    attributes.transform3D = transform;
    attributes.zIndex = NSIntegerMax - attributesPath.row;
    
    //    NSLog(@"IDX: %d. MinX: %.2f. MaxX: %.2f. Interpolated: %.2f. Interpolated angle: %.2f",
    //          (int32_t)attributesPath.row,
    //          minX,
    //          maxX,
    //          interpolatedX,
    //          angle);
}

@end
