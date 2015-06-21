
#import "LTUserThreadListReq.h"
#import "LTUICarMeetFeed.h"
@implementation LTUserThreadListReq
- (void) didGetMessage:(PMUserThreadListRsp*)message
{
    NSMutableArray* array = [NSMutableArray new];
    for (PMThreadInfo* info in message.list) {
        LTUICarMeetFeed* feed = [[LTUICarMeetFeed alloc] initWithThreadInfo:info];
        [array addObject:feed];
    }
    [self doUIOnSuccced:array];
}
@end

