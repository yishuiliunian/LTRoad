
#import "PMThreadListRsp.h"
@implementation PMThreadListRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"offset":@"offset",
@"limit":@"limit",
@"total":@"total",
@"list":@"list",

            };
}
 

    + (NSValueTransformer*) listJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMThreadInfo")]];
    }
    

@end