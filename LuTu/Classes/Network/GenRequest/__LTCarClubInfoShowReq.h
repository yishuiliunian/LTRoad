
#import "MSRequest.h"
#import "PMCategoryInfo.h"
@interface __LTCarClubInfoShowReq : MSRequest

@property(nonatomic,strong) NSString* carClubId;


- (void) didGetMessage:(PMCategoryInfo*)message;
@end
    
