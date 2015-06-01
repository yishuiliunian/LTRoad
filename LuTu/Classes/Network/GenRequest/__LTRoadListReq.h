
#import "MSRequest.h"
#import "PMRouteListRsp.h"
@interface __LTRoadListReq : MSRequest

@property(nonatomic,assign) int64_t pageNo;

@property(nonatomic,assign) int64_t pageSize;

@property(nonatomic,strong) NSString* cityId;

@property(nonatomic,strong) NSString* name;

@property(nonatomic,strong) NSString* categoryName;


- (void) didGetMessage:(PMRouteListRsp*)message;
@end
    
