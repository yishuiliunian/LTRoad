
#import "LTSearchReq.h"

@implementation LTSearchReq
- (void) didGetMessage:(PMSearchRsp*)message
{
    [self doUIOnSuccced:message];
}
@end

