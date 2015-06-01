
#import "PMThreadSearchInfo.h"
@implementation PMThreadSearchInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"thread_id":@"thread_id",
@"title":@"title",
@"user_avatar_url":@"user_avatar_url",
@"user_name":@"user_name",
@"create_time":@"create_time",
@"post_count":@"post_count",

            };
}

+ (NSValueTransformer*) thread_idJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) titleJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) user_avatar_urlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) user_nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) create_timeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
