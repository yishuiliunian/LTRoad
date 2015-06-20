
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

+ (NSValueTransformer*) userIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) cityJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) phoneJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) avatarUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) vehicleModelJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) drivingYearJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) statusJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"oauthType"])
	{
	   self.oauthType = 0;
	}

else if([key isEqualToString:@"createTime"])
	{
	   self.createTime = 0;
	}


}

@end
