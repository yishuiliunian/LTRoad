
#import "LTCarClubMemberQuitReq.h"

@implementation LTCarClubMemberQuitReq
- (void) didGetMessage:(PMNullModel*)message
{
    [self doUIOnSuccced:message];
}
@end

