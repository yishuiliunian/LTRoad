//
//  PMLineSegment.m
//  LuTu
//
//  Created by stonedong on 15/5/25.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMLineSegment.h"
#import "LTGlobals.h"
#import "NSValueTransformer+NSString.h"
#import <Mantle.h>
@implementation PMLineSegment
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(distance),
             LTMantleSameMapPair(lineId),
             LTMantleSameMapPair(name),
             LTMantleSameMapPair(routeId),
             LTMantleSameMapPair(routeIndex),
             LTMantleSameMapPair(locationStart),
             LTMantleSameMapPair(locationEnd)
             };
}
//#define __DEFINE_URL_Tansform(name,sub) \
//+ (NSValueTransformer*) name##sub \
//{ \
//return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName]; \
//}
//
//#define DEFINE_URL_Tansform(name) __DEFINE_URL_Tansform(name,JSONTransformer)
+ (NSValueTransformer*) locationStartJSONTransformer
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
            *success = NO;
            return nil;
        } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            if ([value isKindOfClass:[PMLinePoint class]]) {
                PMLinePoint* point = (PMLinePoint*) value;
                *success = YES;
                return [NSString stringWithFormat:@"%f,%f", point.lat, point.lng];
            }
            return nil;
        }];
}


+ (NSValueTransformer*) locationEndJSONTransformer
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
        *success = NO;
        return nil;
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:[PMLinePoint class]]) {
            PMLinePoint* point = (PMLinePoint*) value;
            *success = YES;
            return [NSString stringWithFormat:@"%f,%f", point.lat, point.lng];
        }
        return nil;
    }];
}
@end
