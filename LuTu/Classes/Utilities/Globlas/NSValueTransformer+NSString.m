//
//  NSValueTransformer+NSString.m
//  LuTu
//
//  Created by stonedong on 15/5/28.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "NSValueTransformer+NSString.h"
#import <Mantle.h>

NSString * const TMDStringValueTransformerName = @"TMDStringValueTransformerName";
NSString* const TMDInt32ValueTransformerName = @"TMDInt32ValueTransformerName";
NSString* const TMDIntValueTransformerName = @"TMDIntValueTransformerName";
NSString* const TMDInt64ValueTransformerName = @"TMDInt64ValueTransformerName";
@implementation NSValueTransformer (NSString)
+ (void)load {
    @autoreleasepool {
        
        
        MTLValueTransformer* stringValueTransformer = [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            NSString* ret = nil ;
            if ([value isKindOfClass:[NSNumber class]]) {
                ret = [(NSNumber*)value stringValue];
            } else if ([value isKindOfClass:[NSNull class]]) {
                ret = @"";
            }
            else {
                ret = (NSString*)value;
            }
            *success = YES;
            return ret;
            
            
        } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            *success = YES;
            return value;
        }];
        
        MTLValueTransformer* int32ValueTransformer = [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            if (!value) {
                return @(0);
            } else if ([value isKindOfClass:[NSNull class]]) {
                return @(0);
            } else if([value isKindOfClass:[NSString class]]) {
                return @([value intValue]);
            }
            *success = YES;
            return @(0);
        } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            *success = YES;
            return [NSString stringWithFormat:@"%d",value];
        }];
        
        
        
        MTLValueTransformer* int64ValueTransformer = [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            if (!value) {
                return @(0);
            } else if ([value isKindOfClass:[NSNull class]]) {
                return @(0);
            } else if([value isKindOfClass:[NSString class]]) {
                return @([value longLongValue]);
            }
            *success = YES;
            return @(0);
        } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            *success = YES;
            return [NSString stringWithFormat:@"%d",value];
        }];
        [NSValueTransformer setValueTransformer:int32ValueTransformer forName:TMDInt32ValueTransformerName];
        [NSValueTransformer setValueTransformer:int32ValueTransformer forName:TMDIntValueTransformerName];
        [NSValueTransformer setValueTransformer:int64ValueTransformer forName:TMDInt64ValueTransformerName];
        [NSValueTransformer setValueTransformer:stringValueTransformer forName:TMDStringValueTransformerName];
    }
}

+ (NSValueTransformer*) sJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}

@end
