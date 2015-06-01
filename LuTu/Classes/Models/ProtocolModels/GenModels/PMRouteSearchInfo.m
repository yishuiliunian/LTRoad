
#import "PMRouteSearchInfo.h"
@implementation PMRouteSearchInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"name":@"name",
@"intro_image_url":@"intro_image_url",
@"attival_time":@"attival_time",

            };
}

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) intro_image_urlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) attival_timeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
