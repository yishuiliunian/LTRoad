
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
    [self doUIOnSuccced:array];
}
@end

