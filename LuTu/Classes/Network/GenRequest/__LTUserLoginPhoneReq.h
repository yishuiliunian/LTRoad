
#import "MSRequest.h"
#import "PMTokenAuthRsp.h"
@interface __LTUserLoginPhoneReq : MSRequest

@property(nonatomic,strong) NSString* phone;

@property(nonatomic,strong) NSString* password;


- (void) didGetMessage:(PMTokenAuthRsp*)message;
@end
    
