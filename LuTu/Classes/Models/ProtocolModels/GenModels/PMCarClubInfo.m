
#import "PMCarClubInfo.h"
@implementation PMCarClubInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"carClubId":@"carClubId",
@"name":@"name",
@"introText":@"introText",
@"introImageUrl":@"introImageUrl",
@"memberList":@"memberList",

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
    
 

    + (NSValueTransformer*) memberListJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMClubMember")]];
    }
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    
}

@end
