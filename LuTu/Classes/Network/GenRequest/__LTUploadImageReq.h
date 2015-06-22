
#import "MSRequest.h"
#import "PMUploadImageRsp.h"
@interface __LTUploadImageReq : MSRequest

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(PMUploadImageRsp*)message;
@end
    
