
#import "PMRouteCategoryInfo.h"
@implementation PMRouteCategoryInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"color":@"color",
@"name":@"name",

            };
}

+ (NSValueTransformer*) colorJSONTransformer
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
    
}

@end
