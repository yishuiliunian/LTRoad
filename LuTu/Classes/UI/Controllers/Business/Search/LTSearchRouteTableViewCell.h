//
//  LTSearchRouteTableViewCell.h
//  LuTu
//
//  Created by stonedong on 15/6/7.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import "LTUIRouteSearchInfo.h"
@interface LTSearchRouteTableViewCell : UITableViewCell
DEFINE_PROPERTY_STRONG_UIImageView(introImageView);
DEFINE_PROPERTY_STRONG_UILabel(titleLabel);
DEFINE_PROPERTY_STRONG_UILabel(timeLabel);
DEFINE_PROPERTY_STRONG(LTUIRouteSearchInfo*, routeInfo);
@end
