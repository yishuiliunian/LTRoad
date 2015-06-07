
#import "LTUserCarClubListReq.h"
#import "LTUIMyCarClubInfo.h"
@implementation LTUserCarClubListReq
- (void) didGetMessage:(PMUserClubListRsp*)message
{
    NSMutableArray* clubInfos = [NSMutableArray new];
    for (PMUserCarClub* clubInfo in message.list) {
        LTUIMyCarClubInfo* carInfo = [[LTUIMyCarClubInfo alloc] initWithPMUserCarClubInfo:clubInfo];
        [clubInfos addObject:carInfo];
    }
    [self doUIOnSuccced:clubInfos];
}
@end

