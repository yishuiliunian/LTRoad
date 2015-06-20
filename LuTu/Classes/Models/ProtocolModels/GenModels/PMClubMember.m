
#import "PMClubMember.h"
@implementation PMClubMember
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"name":@"name",
@"memberType":@"memberType",
@"vihicleModel":@"vihicleModel",
@"avatarUrl":@"avatarUrl",

            };
}

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) vihicleModelJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) avatarUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"memberType"])
	{
	   self.memberType = 0;
	}


}

@end
