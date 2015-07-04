
#import "LTRouteCancelCollectReq.h"

@implementation LTRouteCancelCollectReq
- (void) didGetMessage:(PMNullModel*)message
{
    [self doUIOnSuccced:message];
}
@end

