
#import "LTRoadListReq.h"
#import "LTRecommendLine.h"
@implementation LTRoadListReq
- (void) didGetMessage:(PMRouteListRsp*)message
{
    
    NSMutableArray* array = [NSMutableArray new];
    for (PMRouteInfo* line in message.list) {
        LTRecommendLine* rLine = [[LTRecommendLine alloc] initWithNetworkModel:line];
        [array addObject:rLine];
    }
#ifdef DEBUG
    if (array.count) {
        for (int i = 0; i < 100; i++) {
            [array addObject:array.firstObject];
        }
    }
    
#endif
    [self doUIOnSuccced:array];
}
@end

