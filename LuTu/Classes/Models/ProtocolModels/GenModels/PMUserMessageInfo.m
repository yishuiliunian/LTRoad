
#import "PMUserMessageInfo.h"
@implementation PMUserMessageInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"messageId":@"messageId",
@"content":@"content",
@"userId":@"userId",
@"createTime":@"createTime",

            };
}

+ (NSValueTransformer*) messageIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) contentJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) userIdJSONTransformer
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


}

@end
