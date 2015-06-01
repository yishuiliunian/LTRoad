
#import "MSRequest.h"
#import "PMThreadPostListRsp.h"
@interface __LTThreadPostListReq : MSRequest

@property(nonatomic,assign) int64_t pageNo;

@property(nonatomic,assign) int64_t pageSize;

@property(nonatomic,strong) NSString* pageId;

@property(nonatomic,strong) NSString* creatorId;


- (void) didGetMessage:(PMThreadPostListRsp*)message;
@end
    
