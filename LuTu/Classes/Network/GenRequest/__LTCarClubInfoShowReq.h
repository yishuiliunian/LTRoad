
#import "MSRequest.h"
#import "PMCarClubInfo.h"
@interface __LTCarClubInfoShowReq : MSRequest

@property(nonatomic,strong) NSString* carClubId;


- (void) didGetMessage:(PMCarClubInfo*)message;
@end
    
