
#import "LTUserCarClubListReq.h"
#import "LTUICarMeet.h"
#import "PMUserClubInfo.h"
@implementation LTUserCarClubListReq
- (void) didGetMessage:(PMUserClubListRsp*)message
{
    NSMutableArray* clubInfos = [NSMutableArray new];
    for (PMUserClubInfo* clubInfo in message.list) {
        LTUICarMeet* carInfo = [[LTUICarMeet alloc] initWithClubInfo:clubInfo];
        [clubInfos addObject:carInfo];
    }
    [self doUIOnSuccced:clubInfos];
}
@end

