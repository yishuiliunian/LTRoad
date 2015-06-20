
#import "PMUserCarClubSimpleRsp.h"
@implementation PMUserCarClubSimpleRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"list":@"list",

            };
}
 

    + (NSValueTransformer*) listJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMUserCarClubSimpleInfo")]];
    }
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    
}

@end
