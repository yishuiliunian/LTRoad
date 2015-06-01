
#import "MSRequest.h"
#import "PMSearchClubInfo.h"
@interface __LTCarClubSerachReq : MSRequest

@property(nonatomic,assign) int64_t pageNo;

@property(nonatomic,assign) int64_t pageSize;

@property(nonatomic,strong) NSString* name;


- (void) didGetMessage:(PMSearchClubInfo*)message;
@end
    
