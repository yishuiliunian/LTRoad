
#import "PMSearchRsp.h"
@implementation PMSearchRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"routes":@"routes",
@"clubs":@"clubs",
@"threads":@"threads",

            };
}
 

    + (NSValueTransformer*) routesJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMRouteSearchInfo")]];
    }
    
 

    + (NSValueTransformer*) clubsJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMClubSearchInfo")]];
    }
    
 

    + (NSValueTransformer*) threadsJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMThreadSearchInfo")]];
    }
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    
}

@end
