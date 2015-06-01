
#import "MSRequest.h"
#import "PMUserInfoShowRsp.h"
@interface __LTUserInfoShowReq : MSRequest

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(PMUserInfoShowRsp*)message;
@end
    
