//
//  DZExpandCollectionView.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "DZExpandCollectionView.h"
#import "DZExpandCollectionViewCell.h"
@class DZExpandCollectionView;
@interface DZExpandCollectionViewTouchDelegate : NSObject <UIGestureRecognizerDelegate>
@property (nonatomic, weak) DZExpandCollectionView* collectionView;
@end

@implementation DZExpandCollectionViewTouchDelegate

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL) gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        UITapGestureRecognizer* tap = (UITapGestureRecognizer*)gestureRecognizer;
        if (tap.numberOfTapsRequired == 2) {
            return !self.collectionView.expanded;
        } else if (tap.numberOfTapsRequired == 1) {
            return self.collectionView.expanded;
        }
    }
    return YES;
}
@end


@interface DZExpandCollectionView ()
{
    CGRect _unexpandedCellFrame;
    NSArray* _beforeCells;
    NSArray* _afertCells;
}
@property (nonatomic, strong) DZExpandCollectionViewTouchDelegate* touchDelegate;
@end

@implementation DZExpandCollectionView

- (instancetype) initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (!self) {
        return self;
    }
    [self expandCommonInit];
    return self;
}

- (void) expandCommonInit
{
    UITapGestureRecognizer* tapGestrure = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapAtCell:)];
    tapGestrure.numberOfTapsRequired = 2;
    tapGestrure.numberOfTouchesRequired = 1;
    self.touchDelegate = [DZExpandCollectionViewTouchDelegate new];
    //
    tapGestrure.delegate = self.touchDelegate;
    [self addGestureRecognizer:tapGestrure];
    
    
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapAtCell:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    tapGestrure.delegate = self.touchDelegate;
    [singleTap requireGestureRecognizerToFail:tapGestrure];
    [self addGestureRecognizer:singleTap];
    
    self.backgroundColor = [UIColor clearColor];
    _expanded = NO;
}

- (void) handleSingleTapAtCell:(UITapGestureRecognizer*)tapGR
{
    if (tapGR.state == UIGestureRecognizerStateRecognized) {
        if (!self.expanded) {
            return;
        }
        CGPoint point = [tapGR locationInView:self];
        NSArray* visibleCells = [self.visibleCells copy];
        UICollectionViewCell* tapCell = nil;
        for (UICollectionViewCell* cell in visibleCells) {
            if (CGRectContainsPoint(cell.frame, point)) {
                tapCell = cell;
                break;
            }
        }
        if (!tapCell) {
            return;
        }
        if (![tapCell isKindOfClass:[DZExpandCollectionViewCell class]]) {
            return;
        }
        [self closeExpand:(DZExpandCollectionViewCell*)tapCell];
    }
}

- (void) handleDoubleTapAtCell:(UITapGestureRecognizer*)tapGR
{
    if (tapGR.state == UIGestureRecognizerStateRecognized) {
        if (self.expanded) {
            return;
        }
        CGPoint point = [tapGR locationInView:self];
        NSArray* visibleCells = [self.visibleCells copy];
        UICollectionViewCell* tapCell = nil;
        for (UICollectionViewCell* cell in visibleCells) {
            if (CGRectContainsPoint(cell.frame, point)) {
                tapCell = cell;
                break;
            }
        }
        if (!tapCell) {
            return;
        }
        if (![tapCell isKindOfClass:[DZExpandCollectionViewCell class]]) {
            return;
        }
        [self expandViewAtCell:(DZExpandCollectionViewCell*)tapCell];
    }
}

- (void) expandViewAtCell:(DZExpandCollectionViewCell*)tapCell
{
    NSMutableArray* beforeCells =  [NSMutableArray new];
    NSMutableArray* afertCells = [NSMutableArray new];
    
    NSArray* visibleCells = [self.visibleCells copy];
    for (UICollectionViewCell* cell in visibleCells) {
        if (cell == tapCell) {
            continue;
        }
        if (CGRectGetMaxX(cell.frame) < CGRectGetMinX(tapCell.frame)) {
            [beforeCells addObject:cell];
        } else if (CGRectGetMinX(cell.frame) > CGRectGetMaxX(tapCell.frame)) {
            [afertCells addObject:cell];
        } else {
            [beforeCells addObject:cell];
        }
    }
    _beforeCells = beforeCells;
    _afertCells = afertCells;
    self.scrollEnabled = NO;
    CGFloat leftOffset = CGRectGetMinX(tapCell.frame) - self.contentOffset.x;
    CGFloat rightOffset = self.contentOffset.x + CGRectGetWidth(self.frame) -  CGRectGetMaxX(tapCell.frame);
   
    _expanded = YES;
    _unexpandedCellFrame = tapCell.frame;
    [UIView animateWithDuration:0.24 animations:^{
        for (UICollectionViewCell* cell in beforeCells) {
            cell.frame = CGRectOffset(cell.frame, -leftOffset, 0);
        }
        
        for (UICollectionViewCell* cell in afertCells) {
            cell.frame = CGRectOffset(cell.frame, rightOffset, 0);
        }
        CGRect cellFrame = tapCell.frame;
        cellFrame.origin.x = self.contentOffset.x;
        cellFrame.size.width = CGRectGetWidth(self.frame);
        tapCell.frame = cellFrame;
        tapCell.expanded = YES;
    }];
}

- (void) closeExpand:(DZExpandCollectionViewCell*)tapCell
{
    NSArray* visibleCells = [self.visibleCells copy];
    for (DZExpandCollectionViewCell* cell in visibleCells) {
        cell.expanded = NO;
    }
    CGFloat leftOffset = CGRectGetMinX(_unexpandedCellFrame) - self.contentOffset.x;
    CGFloat rightOffset = self.contentOffset.x + CGRectGetWidth(self.frame) -  CGRectGetMaxX(_unexpandedCellFrame);
    [UIView animateWithDuration:0.24 animations:^{
        for (UICollectionViewCell* cell in _beforeCells) {
            cell.frame = CGRectOffset(cell.frame, leftOffset, 0);
        }
        
        for (UICollectionViewCell* cell in _afertCells) {
            cell.frame = CGRectOffset(cell.frame, -rightOffset, 0);
        }
        tapCell.frame = _unexpandedCellFrame;
    } completion:^(BOOL finished) {
        self.scrollEnabled = YES;
        tapCell.expanded = NO;
        _expanded = NO;
    }];
}

- (void) reloadData
{
    if (self.expanded) {
        return;
    }
    [super reloadData];
}
@end
