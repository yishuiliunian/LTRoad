
#import "LTCarClubSerachReq.h"

@implementation LTCarClubSerachReq
- (void) didGetMessage:(PMSearchClubInfo*)message
{
    [self doUIOnSuccced:message];
}
@end

