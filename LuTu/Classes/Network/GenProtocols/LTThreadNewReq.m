
#import "LTThreadNewReq.h"

@implementation LTThreadNewReq
- (void) didGetMessage:(PMNullModel*)message
{
    [self doUIOnSuccced:message];
}
@end

