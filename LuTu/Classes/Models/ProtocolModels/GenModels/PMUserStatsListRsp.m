
#import "PMUserStatsListRsp.h"
@implementation PMUserStatsListRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"clubMemberCount":@"clubMemberCount",
@"threadCount":@"threadCount",
@"userName":@"userName",

            };
}

+ (NSValueTransformer*) userNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

@end
