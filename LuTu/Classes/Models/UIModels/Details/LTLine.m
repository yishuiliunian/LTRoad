//
//  LTLine.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTLine.h"

@implementation LTLine
- (instancetype) initWithPMLine:(PMLine *)line
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.distance = @"100";
    self.timeCoast = @"1-3天";
    self.carStyle = @"轿车";
    self.rloadCondition = @"良好";
    self.startPointName = @"深圳大学";
    self.endPointName = @"北京";
    
    return self;
}
@end
