
#import "MSRequest.h"
#import "PMFavoriteListRsp.h"
@interface __LTUserFavoriteRouteListReq : MSRequest

@property(nonatomic,assign) int64_t pageNo;

@property(nonatomic,assign) int64_t pageSize;

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(PMFavoriteListRsp*)message;
@end
    
