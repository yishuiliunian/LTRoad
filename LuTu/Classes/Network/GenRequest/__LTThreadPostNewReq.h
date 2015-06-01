
#import "MSRequest.h"
#import "PMNullModel.h"
@interface __LTThreadPostNewReq : MSRequest

@property(nonatomic,strong) NSString* userId;

@property(nonatomic,strong) NSString* threadId;

@property(nonatomic,strong) NSString* content;


- (void) didGetMessage:(PMNullModel*)message;
@end
    
