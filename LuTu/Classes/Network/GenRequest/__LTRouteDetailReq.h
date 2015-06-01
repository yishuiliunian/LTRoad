
#import "MSRequest.h"
#import "PMRouteDetailRsp.h"
@interface __LTRouteDetailReq : MSRequest

@property(nonatomic,strong) NSString* userId;

@property(nonatomic,strong) NSString* routeId;


- (void) didGetMessage:(PMRouteDetailRsp*)message;
@end
    
