
#import "MSRequest.h"
#import "PMThreadListRsp.h"
@interface __LTThreadListReq : MSRequest

@property(nonatomic,assign) int64_t pageNo;

@property(nonatomic,assign) int64_t pageSize;

@property(nonatomic,strong) NSString* carClubId;


- (void) didGetMessage:(PMThreadListRsp*)message;
@end
    
