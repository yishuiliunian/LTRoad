
#import "LTRouteCollectReq.h"

@implementation LTRouteCollectReq
- (void) didGetMessage:(PMNullModel*)message
{
    [self doUIOnSuccced:message];
}
@end

