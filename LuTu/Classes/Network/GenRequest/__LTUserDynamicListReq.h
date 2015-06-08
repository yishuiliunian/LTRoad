
#import "MSRequest.h"
#import "PMUserDynamicListRsp.h"
@interface __LTUserDynamicListReq : MSRequest

@property(nonatomic,assign) int64_t pageNo;

@property(nonatomic,assign) int64_t pageSize;

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(PMUserDynamicListRsp*)message;
@end
    
