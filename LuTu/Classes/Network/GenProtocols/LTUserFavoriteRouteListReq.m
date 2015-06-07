
#import "LTUserFavoriteRouteListReq.h"
#import "LTUIRouteSearchInfo.h"
@implementation LTUserFavoriteRouteListReq

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.pageSize = 100;
    return self;
}
- (void) didGetMessage:(PMFavoriteListRsp*)message
{
    NSMutableArray* array = [NSMutableArray new];
    for (PMFavoriteInfo* fa in message.list) {
        LTUIRouteSearchInfo* info = [[LTUIRouteSearchInfo alloc] initWithFavoriteInfo:fa];
        [array addObject:info];
    }
    [self doUIOnSuccced:array];
}
@end

