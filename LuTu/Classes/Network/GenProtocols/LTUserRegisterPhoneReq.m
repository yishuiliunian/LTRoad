
#import "LTUserRegisterPhoneReq.h"

@implementation LTUserRegisterPhoneReq
- (void) didGetMessage:(PMTokenAuthRsp*)message
{
    [self doUIOnSuccced:message];
}
@end

