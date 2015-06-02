
#import "LTUserCarClubSimpleListReq.h"
#import "LTUICarMeet.h"
@implementation LTUserCarClubSimpleListReq
- (void) didGetMessage:(PMUserCarClubSimpleRsp*)message
{
    NSMutableArray* array = [NSMutableArray new];
    for (PMUserCarClubSimpleInfo* info in message.list) {
        LTUICarMeet* carMeet = [[LTUICarMeet alloc] initWithSimpleInfo:info];
        [array addObject:carMeet];
    }
    [self doUIOnSuccced:array];
}
@end

