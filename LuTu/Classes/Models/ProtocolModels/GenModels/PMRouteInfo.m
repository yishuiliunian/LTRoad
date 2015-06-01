
#import "PMRouteInfo.h"
@implementation PMRouteInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"routeId":@"routeId",
@"name":@"name",
@"introImageUrl":@"introImageUrl",
@"favCount":@"favCount",
@"location":@"location",
@"categoryList":@"categoryList",

            };
}

+ (NSValueTransformer*) routeIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introImageUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) locationJSONTransformer
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
