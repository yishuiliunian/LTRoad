
#import "LTUserInfoCompleteReq.h"

@implementation LTUserInfoCompleteReq
- (void) didGetMessage:(PMNullModel*)message
{
    [self doUIOnSuccced:message];
}
@end

