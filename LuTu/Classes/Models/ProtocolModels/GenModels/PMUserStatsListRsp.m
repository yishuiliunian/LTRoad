
#import "PMUserStatsListRsp.h"
@implementation PMUserStatsListRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"clubMemberCount":@"clubMemberCount",
@"threadCount":@"threadCount",
@"userName":@"userName",
@"dynamicCount":@"dynamicCount",
@"message":@"message",
@"messageCount":@"messageCount",
@"status":@"status",

            };
}

+ (NSValueTransformer*) userNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) messageJSONTransformer
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

else if([key isEqualToString:@"dynamicCount"])
	{
	   self.dynamicCount = 0;
	}

else if([key isEqualToString:@"messageCount"])
	{
	   self.messageCount = 0;
	}

else if([key isEqualToString:@"status"])
	{
	   self.status = 0;
	}


}

@end
