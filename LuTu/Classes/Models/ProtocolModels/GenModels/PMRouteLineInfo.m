
#import "PMRouteLineInfo.h"
@implementation PMRouteLineInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"lineId":@"lineId",
@"routeId":@"routeId",
@"name":@"name",
@"routeIndex":@"routeIndex",
@"locationStart":@"locationStart",

            };
}

+ (NSValueTransformer*) lineIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) routeIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) locationStartJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
