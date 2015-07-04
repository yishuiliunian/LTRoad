
#import "LTThreadPostNewReq.h"

@implementation LTThreadPostNewReq
- (void) didGetMessage:(PMNullModel*)message
{
    [self doUIOnSuccced:message];
}
@end

