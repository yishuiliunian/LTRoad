
#import "PMUploadImageRsp.h"
@implementation PMUploadImageRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"image_url":@"image_url",
@"imageId":@"imageId",

            };
}

+ (NSValueTransformer*) image_urlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) imageIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    
}

@end
