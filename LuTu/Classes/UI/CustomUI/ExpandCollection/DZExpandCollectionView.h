//
//  DZExpandCollectionView.h
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZExpandCollectionViewCell.h"
@class DZExpandCollectionView;
@protocol DZExpandCollectionViewDelegate
- (void) expandCollectionView:(DZExpandCollectionView*)expandView hanldeSingleTapAtIndex:(NSInteger)index;
@end

@interface DZExpandCollectionView : UICollectionView
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, weak) NSObject<DZExpandCollectionViewDelegate>* expandDelegate;
@property (nonatomic, assign ,readonly) BOOL expanded;
- (void) closeExpand:(DZExpandCollectionViewCell*)tapCell;
@end
