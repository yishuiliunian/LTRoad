
#import "LTCarClubInfoShowReq.h"

@implementation LTCarClubInfoShowReq

- (void) didGetMessage:(PMCarClubInfo *)message
{
        [self doUIOnSuccced:message];
}
@end

