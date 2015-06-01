
#import "MSRequest.h"
#import "PMNullModel.h"
@interface __LTUserInfoCompleteReq : MSRequest

@property(nonatomic,strong) NSString* name;

@property(nonatomic,strong) NSString* ctiy;

@property(nonatomic,strong) NSString* phone;

@property(nonatomic,strong) NSString* avatarUrl;

@property(nonatomic,strong) NSString* vehicleModel;

@property(nonatomic,strong) NSString* drivingYear;

@property(nonatomic,assign) int64_t oauthType;

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(PMNullModel*)message;
@end
    
