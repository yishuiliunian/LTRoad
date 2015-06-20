
#import "PMUserStatsListRsp.h"
@implementation PMUserStatsListRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"clubMemberCount":@"clubMemberCount",
@"threadCount":@"threadCount",
@"userName":@"userName",

            };
}

+ (NSValueTransformer*) userNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"clubMemberCount"])
	{
	   self.clubMemberCount = 0;
	}

else if([key isEqualToString:@"threadCount"])
	{
	   self.threadCount = 0;
	}


}

@end
