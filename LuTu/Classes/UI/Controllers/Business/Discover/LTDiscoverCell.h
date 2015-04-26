//
//  LTDiscoverCell.h
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LTUIDiscoverItem.h"
#import <DZProgramDefines.h>
@interface LTDiscoverCell : UICollectionViewCell;
DEFINE_PROPERTY_STRONG_UIImageView(backgroundImageView);
DEFINE_PROPERTY_STRONG(LTUIDiscoverItem*, discoverItem);
DEFINE_PROPERTY_STRONG_UILabel(titleLabel);
@end
