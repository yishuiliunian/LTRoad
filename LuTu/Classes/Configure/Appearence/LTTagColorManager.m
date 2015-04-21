//
//  LTTagColorManager.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTTagColorManager.h"
#import <DZSingletonFactory.h>
#import "LTColors.h"
@interface LTTagColorManager ()
{
    NSMutableDictionary* _colorMap;
}
@end

@implementation LTTagColorManager
+ (LTTagColorManager*) shareInstance
{
    return DZSingleForClass([self class]);
}
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _colorMap = [NSMutableDictionary new];
    return self;
}
- (UIColor*) colorForKey:(NSString *)key
{
    if (!key) {
        return nil;
    }
    UIColor* color = _colorMap[key];
    if (!color) {
        color = LTColorTagDefault();
        _colorMap[key] = color;
    }
    return color;
}



@end
