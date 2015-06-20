
#import "PMCategoryInfo.h"
@implementation PMCategoryInfo
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
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"routeCount"])
	{
	   self.routeCount = 0;
	}


}

@end
