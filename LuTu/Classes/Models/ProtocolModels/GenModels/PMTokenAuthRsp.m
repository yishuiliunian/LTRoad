
#import "PMTokenAuthRsp.h"
@implementation PMTokenAuthRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"userId":@"userId",
@"name":@"name",
@"city":@"city",
@"phone":@"phone",
@"avatarUrl":@"avatarUrl",
@"drivingYear":@"drivingYear",
@"status":@"status",
@"oauthType":@"oauthType",
@"createTime":@"createTime",
@"isFirst":@"isFirst",

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
    

+ (NSValueTransformer*) drivingYearJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) statusJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) oauthTypeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"createTime"])
	{
	   self.createTime = 0;
	}

else if([key isEqualToString:@"isFirst"])
	{
	   self.isFirst = 0;
	}


}

@end
