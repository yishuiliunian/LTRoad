
#import "MSRequest.h"
#import "PMUserThreadListRsp.h"
@interface __LTUserThreadListReq : MSRequest

@property(nonatomic,assign) int64_t pageNo;

@property(nonatomic,assign) int64_t pageSize;

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(PMUserThreadListRsp*)message;
@end
    
