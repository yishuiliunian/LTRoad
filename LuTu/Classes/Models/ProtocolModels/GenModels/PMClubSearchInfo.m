
#import "PMClubSearchInfo.h"
@implementation PMClubSearchInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"club_id":@"club_id",
@"name":@"name",
@"member_count":@"member_count",
@"thread_count":@"thread_count",

            };
}

+ (NSValueTransformer*) club_idJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
