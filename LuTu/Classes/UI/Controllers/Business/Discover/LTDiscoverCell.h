//
//  LTDiscoverCell.h
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "CBetterCollectionViewCell.h"
#import "LTUIDiscoverItem.h"
@interface LTDiscoverCell : CBetterCollectionViewCell
DEFINE_PROPERTY_STRONG_UIImageView(backgroundImageView);
DEFINE_PROPERTY_STRONG(LTUIDiscoverItem*, discoverItem);
@end
