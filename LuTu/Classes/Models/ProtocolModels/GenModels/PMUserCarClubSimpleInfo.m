
#import "PMUserCarClubSimpleInfo.h"
@implementation PMUserCarClubSimpleInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"carClubId":@"carClubId",
@"name":@"name",
@"introText":@"introText",
@"introImageUrl":@"introImageUrl",

            };
}

+ (NSValueTransformer*) carClubIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introTextJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introImageUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
