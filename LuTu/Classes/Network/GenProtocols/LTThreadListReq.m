
#import "LTThreadListReq.h"
#import "LTUICarMeetFeed.h"
@implementation LTThreadListReq
- (void) didGetMessage:(PMThreadListRsp*)message
{
    NSMutableArray* array = [NSMutableArray new];
    for (PMThreadInfo* info in message.list) {
        LTUICarMeetFeed* feed = [[LTUICarMeetFeed alloc] initWithThreadInfo:info];
        [array addObject:feed];
    }
    [self doUIOnSuccced:array];
}
@end

