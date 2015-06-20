
#import "PMClubSearchInfo.h"
@implementation PMClubSearchInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"carClubId":@"carClubId",
@"createTime":@"createTime",
@"creatorId":@"creatorId",
@"introImageUrl":@"introImageUrl",
@"introText":@"introText",
@"isDefault":@"isDefault",
@"memberList":@"memberList",
@"name":@"name",
@"memberCount":@"memberCount",
@"threadCount":@"threadCount",

            };
}

+ (NSValueTransformer*) carClubIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) creatorIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introImageUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introTextJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) isDefaultJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) memberListJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) nameJSONTransformer
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

else if([key isEqualToString:@"memberCount"])
	{
	   self.memberCount = 0;
	}

else if([key isEqualToString:@"threadCount"])
	{
	   self.threadCount = 0;
	}


}

@end
