
#import "LTAddRouteCommentReq.h"

@implementation LTAddRouteCommentReq
- (void) didGetMessage:(PMNullModel*)message
{
    [self doUIOnSuccced:message];
}
@end

