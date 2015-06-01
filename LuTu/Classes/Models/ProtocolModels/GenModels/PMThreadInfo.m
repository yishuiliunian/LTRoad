
#import "PMThreadInfo.h"
@implementation PMThreadInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"threadId":@"threadId",
@"clubId":@"clubId",
@"title":@"title",
@"creatorId":@"creatorId",
@"postCount":@"postCount",
@"carClubName":@"carClubName",
@"userName":@"userName",
@"userAvastarurl":@"userAvastarurl",
@"content":@"content",

            };
}

+ (NSValueTransformer*) threadIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) clubIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) titleJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) creatorIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) carClubNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) userNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) userAvastarurlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) contentJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
