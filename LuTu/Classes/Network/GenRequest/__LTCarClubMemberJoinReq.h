
#import "MSRequest.h"
#import "PMNullModel.h"
@interface __LTCarClubMemberJoinReq : MSRequest

@property(nonatomic,strong) NSString* userId;

@property(nonatomic,strong) NSString* carClubId;


- (void) didGetMessage:(PMNullModel*)message;
@end
    
