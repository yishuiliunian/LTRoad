
#import "LTUserLoginPhoneReq.h"

@implementation LTUserLoginPhoneReq
- (void) didGetMessage:(PMTokenAuthRsp*)message
{
    [self doUIOnSuccced:message];
}
@end

