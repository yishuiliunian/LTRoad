
#import "LTThreadPostListReq.h"

@implementation LTThreadPostListReq
- (void) didGetMessage:(PMThreadPostListRsp*)message
{
    [self doUIOnSuccced:message];
}
@end

