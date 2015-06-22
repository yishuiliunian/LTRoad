
#import "LTCarClubMemberJoinReq.h"

@implementation LTCarClubMemberJoinReq
- (void) didGetMessage:(PMNullModel*)message
{
    [self doUIOnSuccced:message];
}
@end

