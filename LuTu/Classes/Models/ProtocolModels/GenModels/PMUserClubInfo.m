
#import "PMUserClubInfo.h"
@implementation PMUserClubInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"carClubId":@"carClubId",
@"name":@"name",
@"introText":@"introText",
@"introImageUrl":@"introImageUrl",
@"userCount":@"userCount",
@"threadCount":@"threadCount",

            };
}

+ (NSValueTransformer*) carClubIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introTextJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introImageUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"userCount"])
	{
	   self.userCount = 0;
	}

else if([key isEqualToString:@"threadCount"])
	{
	   self.threadCount = 0;
	}


}

@end
