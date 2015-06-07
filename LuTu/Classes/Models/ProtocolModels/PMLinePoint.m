//
//  PMLinePoint.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMLinePoint.h"
#import "LTGlobals.h"
@implementation PMLinePoint
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(lat),
             LTMantleSameMapPair(lng)
             };
}
@end


NSValueTransformer* PMLinePointJSONTransformer()
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:[NSString class]]) {
            NSString* str = value;
            NSArray* values = [str componentsSeparatedByString:@","];
            if (values.count == 2) {
                PMLinePoint* point = [PMLinePoint new];
                point.lat = [values[0] floatValue];
                point.lng = [values[0] floatValue];
                *success = YES;
                return point;
            }
        }
        PMLinePoint* point = [PMLinePoint new];
        point.lat = 0;
        point.lng = 0;
        *success = YES;
        return point;
        
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:[PMLinePoint class]]) {
            PMLinePoint* point = (PMLinePoint*) value;
            *success = YES;
            return [NSString stringWithFormat:@"%f,%f", point.lat, point.lng];
        }
        return nil;
    }];
}