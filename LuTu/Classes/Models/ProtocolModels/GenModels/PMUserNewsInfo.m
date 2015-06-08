
#import "PMUserNewsInfo.h"
@implementation PMUserNewsInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"dynamicId":@"dynamicId",
@"content":@"content",
@"createTime":@"createTime",
@"userId":@"userId",

            };
}

+ (NSValueTransformer*) dynamicIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) contentJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) userIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
