
#import "PMUserInfoShowRsp.h"
@implementation PMUserInfoShowRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"userId":@"userId",
@"name":@"name",
@"city":@"city",
@"phone":@"phone",
@"avatarUrl":@"avatarUrl",
@"vehicleModel":@"vehicleModel",
@"drivingYear":@"drivingYear",
@"status":@"status",
@"oauthType":@"oauthType",
@"createTime":@"createTime",

            };
}

@end
