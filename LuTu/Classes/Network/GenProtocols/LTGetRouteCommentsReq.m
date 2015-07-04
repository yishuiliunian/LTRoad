
#import "LTGetRouteCommentsReq.h"

@implementation LTGetRouteCommentsReq
- (void) didGetMessage:(PMGetRouteCommentsRsp*)message
{
    [self doUIOnSuccced:message];
}
@end

