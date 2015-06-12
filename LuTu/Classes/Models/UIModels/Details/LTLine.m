//
//  LTLine.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTLine.h"
#import "LTGlobals.h"

@implementation LTLine
- (instancetype) initWithPMLine:(PMRouteDetailRsp *)line
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.routeName = line.name;
    self.distance = line.totalDistance;
    self.timeCoast = line.totalTime;
    self.carStyle = line.carType;
    self.rloadCondition = line.routeStatus;
    self.startPointName = @"深圳大学";
    self.endPointName = @"北京";
    
    NSMutableString* str = [NSMutableString new];
    for (PMRoutePropInfo* prop  in line.routePropDetails) {
        [str appendFormat:@"%@:%@", prop.propDesc, prop.propValue];
    }
    self.introText = [str copy];
    
    NSMutableArray* badgeItems = [NSMutableArray new];
    for (PMCategoryInfo* info  in line.categoryList) {
        LTBadgeItem* item = LTCreateBadgeItemWithText(info.name);
        [badgeItems addObject:item];
    }
    self.categoryBadgeArray = badgeItems;
    _line = line;
    return self;
}

- (void) setCarStyle:(NSString *)carStyle
{
    if (_carStyle != carStyle) {
        _carStyle = carStyle;
    }
}
@end
