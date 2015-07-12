
#import "MSRequest.h"
#import "PMTokenAuthRsp.h"
@interface __LTUserRegisterPhoneReq : MSRequest

@property(nonatomic,strong) NSString* phone;

@property(nonatomic,strong) NSString* password;


- (void) didGetMessage:(PMTokenAuthRsp*)message;
@end
    
