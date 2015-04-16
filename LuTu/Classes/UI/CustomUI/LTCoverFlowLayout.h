//
//  LTCoverFlowLayout.h
//  LuTu
//
//  Created by stonedong on 15/4/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTCoverFlowLayout : UICollectionViewFlowLayout
/**
 *  Max degree that can be applied to individual item.
 *  Default to 45 degrees.
 */
@property (nonatomic) CGFloat maxCoverDegree;

/**
 *  Determines how elements covers each other.
 *  Should be in range 0..1.
 *  Default to 0.25.
 *  Examples:
 *  0 means that items are placed within a continious line.
 *  0.5 means that half of 3 and 1 cover will be behind 2.
 */
@property (nonatomic) CGFloat coverDensity;
@end
