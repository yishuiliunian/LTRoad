
#import "MSRequest.h"
#import "PMUserCarClubSimpleRsp.h"
@interface __LTUserCarClubSimpleListReq : MSRequest

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(PMUserCarClubSimpleRsp*)message;
@end
    
