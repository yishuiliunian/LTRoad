
#import "LTUserThreadListReq.h"
#import "PMUserThreadInfo.h"
#import "LTUICarMeetFeed.h"
@implementation LTUserThreadListReq
- (void) didGetMessage:(PMUserThreadListRsp*)message
{
    NSMutableArray* array = [NSMutableArray new];
    for (PMUserThreadInfo* info in message.list) {
        LTUICarMeetFeed* feed = [[LTUICarMeetFeed alloc] initWithUserThreadInfo:info];
        [array addObject:feed];
    }
    [self doUIOnSuccced:array];
}
@end

