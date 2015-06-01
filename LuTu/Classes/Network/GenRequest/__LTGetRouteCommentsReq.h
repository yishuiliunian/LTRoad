
#import "MSRequest.h"
#import "PMGetRouteCommentsRsp.h"
@interface __LTGetRouteCommentsReq : MSRequest

@property(nonatomic,assign) int64_t pageNo;

@property(nonatomic,assign) int64_t pageSize;

@property(nonatomic,strong) NSString* routeId;


- (void) didGetMessage:(PMGetRouteCommentsRsp*)message;
@end
    
