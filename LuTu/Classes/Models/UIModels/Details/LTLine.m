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
    self.distance = @"100";
//    self.timeCoast = line.duration;
//    self.carStyle = line.applicable_vehicle;
    self.rloadCondition = @"良好";
    self.startPointName = @"深圳大学";
    self.endPointName = @"北京";
//    self.introText = line.summary;
    self.categoryBadgeArray = LTBadgeTextArray(line.categoryList);
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
