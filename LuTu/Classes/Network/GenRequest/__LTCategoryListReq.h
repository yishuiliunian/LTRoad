
#import "MSRequest.h"
#import "PMCategoryListRsp.h"
@interface __LTCategoryListReq : MSRequest

@property(nonatomic,assign) int64_t pageNo;

@property(nonatomic,assign) int64_t pageSize;

@property(nonatomic,strong) NSString* cityId;


- (void) didGetMessage:(PMCategoryListRsp*)message;
@end
    
