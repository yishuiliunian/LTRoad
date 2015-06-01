
#import "PMUserClubRsp1.h"
@implementation PMUserClubRsp1
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"result":@"result",

            };
}
 

    + (NSValueTransformer*) resultJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMUserClubInfo1")]];
    }
    

@end
