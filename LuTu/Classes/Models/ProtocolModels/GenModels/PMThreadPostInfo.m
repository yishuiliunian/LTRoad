
#import "PMThreadPostInfo.h"
@implementation PMThreadPostInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"postId":@"postId",
@"threadId":@"threadId",
@"content":@"content",
@"createTime":@"createTime",
@"creatorName":@"creatorName",
@"creatorAvatarUrl":@"creatorAvatarUrl",

            };
}

+ (NSValueTransformer*) postIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) threadIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) contentJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) creatorNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) creatorAvatarUrlJSONTransformer
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
