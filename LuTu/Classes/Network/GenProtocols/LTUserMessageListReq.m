
#import "LTUserMessageListReq.h"
#import "LTUIMyNew.h"
@implementation LTUserMessageListReq
- (void) didGetMessage:(PMUserMessageListRsp*)message
{

    NSMutableArray* array = [NSMutableArray new];
    for (PMUserMessageInfo* msg in message.list) {
        LTUIMyNew* news = [[LTUIMyNew alloc] initWithPMMessage:msg];
        [array addObject:news];
    }
    [self doUIOnSuccced:array];
}
@end

