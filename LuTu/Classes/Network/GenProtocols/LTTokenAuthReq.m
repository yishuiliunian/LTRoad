
#import "LTTokenAuthReq.h"

@implementation LTTokenAuthReq
- (void) didGetMessage:(PMTokenAuthRsp*)message
{
    [self doUIOnSuccced:message];
}
@end

