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
#import <HexColor.h>
@interface LTTagColorManager ()
{
    NSMutableDictionary* _colorMap;
}
@end

@implementation LTTagColorManager

-  (NSDictionary*) colorJSONData
{
#define LTColorPair(k, v) @""#k : @""#v ,
    return @{
            LTColorPair(亲子游, fa9f9d)
            LTColorPair(吃货, eb7b3c)
            LTColorPair(温泉, 7cccca)
            LTColorPair(露营游, 41525b)
            LTColorPair(酒店游, 978fbe)
            LTColorPair(人文游, 2ba8de)
            LTColorPair(摘果游, 40bfa6)
            LTColorPair(最美自驾游, 9ad0ab)
            LTColorPair(徒步, 142a19)
            LTColorPair(登山, f2a644)
             };
}
+ (LTTagColorManager*) shareInstance
{
    return DZSingleForClass([self class]);
}

- (void) registerColor:(NSString*)hexColor forKey:(NSString*)key
{
    if (!key) {
        return ;
    }
    if (!hexColor) {
        return;
    }
    
    UIColor* color = [UIColor colorWithHexString:hexColor];
    if (color) {
        _colorMap[key] = color;
    }
}
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _colorMap = [NSMutableDictionary new];
    
    NSDictionary* jsonData =[self colorJSONData];
    for (NSString* key  in jsonData.allKeys) {
        NSString* s = jsonData[key];
        UIColor* color = [UIColor colorWithHexString:s];
        _colorMap[key] = color;
    }
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
