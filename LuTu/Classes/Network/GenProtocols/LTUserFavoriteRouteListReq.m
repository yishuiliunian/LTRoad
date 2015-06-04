
#import "LTUserFavoriteRouteListReq.h"

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
    
}
@end

