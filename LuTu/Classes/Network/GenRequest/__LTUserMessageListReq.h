
#import "MSRequest.h"
#import "PMUserMessageListRsp.h"
@interface __LTUserMessageListReq : MSRequest

@property(nonatomic,assign) int64_t pageNo;

@property(nonatomic,assign) int64_t pageSize;

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(PMUserMessageListRsp*)message;
@end
    
