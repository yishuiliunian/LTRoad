
#import "MSRequest.h"
#import "PMNullModel.h"
@interface __PMThreadNewReq : MSRequest

@property(nonatomic,strong) NSString* creatorId;

@property(nonatomic,strong) NSString* clubId;

@property(nonatomic,strong) NSString* title;

@property(nonatomic,strong) NSString* content;

@property(nonatomic,assign) int64_t images;


- (void) didGetMessage:(PMNullModel*)message;
@end
    
