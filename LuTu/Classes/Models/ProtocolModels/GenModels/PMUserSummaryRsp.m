
#import "PMUserSummaryRsp.h"
@implementation PMUserSummaryRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"clubMemberCount":@"clubMemberCount",
@"threadCount":@"threadCount",
@"userName":@"userName",

            };
}

@end
