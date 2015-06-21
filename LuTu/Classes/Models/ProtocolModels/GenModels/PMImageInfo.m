
#import "PMImageInfo.h"
@implementation PMImageInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"createTime":@"createTime",
@"imageId":@"imageId",
@"url":@"url",

            };
}

+ (NSValueTransformer*) imageIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) urlJSONTransformer
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
