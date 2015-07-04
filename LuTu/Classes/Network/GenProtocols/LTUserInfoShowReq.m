
#import "LTUserInfoShowReq.h"

@implementation LTUserInfoShowReq
- (void) didGetMessage:(PMUserInfoShowRsp*)message
{
    [self doUIOnSuccced:message];
}
@end

