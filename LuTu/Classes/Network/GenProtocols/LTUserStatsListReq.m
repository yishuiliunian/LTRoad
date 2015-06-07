
#import "LTUserStatsListReq.h"

@implementation LTUserStatsListReq
- (void) didGetMessage:(PMUserStatsListRsp*)message
{
    [self doUIOnSuccced:message];
}
@end

