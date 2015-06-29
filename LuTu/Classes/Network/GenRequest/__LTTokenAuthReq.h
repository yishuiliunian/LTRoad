
#import "MSRequest.h"
#import "PMTokenAuthRsp.h"
@interface __LTTokenAuthReq : MSRequest

@property(nonatomic,strong) NSString* oAuthOpenId;

@property(nonatomic,strong) NSString* oAuthAccessToken;

@property(nonatomic,assign) int64_t oAuthType;


- (void) didGetMessage:(PMTokenAuthRsp*)message;
@end
    
