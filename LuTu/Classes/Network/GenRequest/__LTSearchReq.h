
#import "MSRequest.h"
#import "PMSearchRsp.h"
@interface __LTSearchReq : MSRequest

@property(nonatomic,strong) NSString* city;

@property(nonatomic,strong) NSString* keyword;


- (void) didGetMessage:(PMSearchRsp*)message;
@end
    
