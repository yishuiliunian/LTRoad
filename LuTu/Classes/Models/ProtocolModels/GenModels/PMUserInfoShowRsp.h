
#import <Mantle.h>

@interface PMUserInfoShowRsp : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* userId;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* city;
@property(nonatomic,strong) NSString* phone;
@property(nonatomic,strong) NSString* avatarUrl;
@property(nonatomic,strong) NSString* vehicleModel;
@property(nonatomic,strong) NSString* drivingYear;
@property(nonatomic,strong) NSString* status;
@property(nonatomic,assign) int32_t oauthType;
@property(nonatomic,assign) int64_t createTime;

@end
  
