
#import "PMRouteCommentInfo.h"
@implementation PMRouteCommentInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"id":@"id",
@"routeId":@"routeId",
@"content":@"content",
@"creatorId":@"creatorId",
@"createTime":@"createTime",
@"avatarUrl":@"avatarUrl",
@"createName":@"createName",

            };
}

+ (NSValueTransformer*) idJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) routeIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) contentJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) creatorIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) createTimeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) avatarUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) createNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
