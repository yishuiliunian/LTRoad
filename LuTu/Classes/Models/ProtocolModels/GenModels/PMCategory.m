
#import "PMCategory.h"
@implementation PMCategory
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"categoryId":@"categoryId",
@"name":@"name",
@"label":@"label",
@"introImageUrl":@"introImageUrl",
@"routeCount":@"routeCount",

            };
}

+ (NSValueTransformer*) categoryIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) labelJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introImageUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
