
#import "MSRequest.h"
#import "PMUserStatsListRsp.h"
@interface __LTUserStatsListReq : MSRequest

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(PMUserStatsListRsp*)message;
@end
    
