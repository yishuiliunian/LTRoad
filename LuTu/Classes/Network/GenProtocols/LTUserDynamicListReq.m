
#import "LTUserDynamicListReq.h"
#import "LTUIMyNew.h"
@implementation LTUserDynamicListReq
- (void) didGetMessage:(PMUserDynamicListRsp*)message
{
    NSMutableArray* array = [NSMutableArray new];
    for (PMUserNewsInfo* info in message.list) {
        LTUIMyNew* myNew = [[LTUIMyNew alloc] initWithPMNews:info];
        [array addObject:myNew];
    }
#ifdef DEBUG
    LTUIMyNew* m = [[LTUIMyNew alloc] init];
    m.dynamicId = @"1";
    m.content = @"aa";
    m.timeText = @"2011";
    
    [array addObject:m];
#endif
    [self doUIOnSuccced:array];
}
@end

