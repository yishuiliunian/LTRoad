
#import "LTRouteDetailReq.h"

@implementation LTRouteDetailReq

- (void) onError:(NSError *)error
{
    [super onError:error];
}
- (void) didGetMessage:(PMRouteDetailRsp*)message
{
    [self doUIOnSuccced:message];
}
@end

