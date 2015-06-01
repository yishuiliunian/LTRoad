
#import "MSRequest.h"
#import "PMUserClubListRsp.h"
@interface __LTUserCarClubListReq : MSRequest

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(PMUserClubListRsp*)message;
@end
    
