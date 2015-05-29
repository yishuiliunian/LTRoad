
#import "PMUserClubRsp.h"
@implementation PMUserClubRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"result":@"result",
@"result":@"result",

            };
}
 

    + (NSValueTransformer*) resultJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMUserClubInfo")]];
    }
    
 

    + (NSValueTransformer*) resultJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMUserClubInfo")]];
    }
    

@end
