
#import "PMFavoriteInfo.h"
@implementation PMFavoriteInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"routeId":@"routeId",
@"name":@"name",
@"introImageUrl":@"introImageUrl",
@"createTime":@"createTime",

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
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"createTime"])
	{
	   self.createTime = 0;
	}


}

@end
