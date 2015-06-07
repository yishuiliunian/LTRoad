
#import "PMThreadSearchInfo.h"
@implementation PMThreadSearchInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"carClubName":@"carClubName",
@"clubId":@"clubId",
@"content":@"content",
@"createTime":@"createTime",
@"creatorId":@"creatorId",
@"images":@"images",
@"postCount":@"postCount",
@"threadId":@"threadId",
@"title":@"title",
@"userAvastarurl":@"userAvastarurl",
@"userName":@"userName",

            };
}

+ (NSValueTransformer*) carClubNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) clubIdJSONTransformer
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
    

+ (NSValueTransformer*) imagesJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) threadIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) titleJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) userAvastarurlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) userNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
