
#import "PMRouteDetailRsp.h"
@implementation PMRouteDetailRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"categoryList":@"categoryList",
@"isFav":@"isFav",
@"name":@"name",
@"introImageUrl":@"introImageUrl",
@"favCount":@"favCount",
@"totalTime":@"totalTime",
@"carType":@"carType",
@"totalDistance":@"totalDistance",
@"routeStatus":@"routeStatus",
@"routePropDetails":@"routePropDetails",
@"pois":@"pois",
@"lines":@"lines",

            };
}
 

    + (NSValueTransformer*) categoryListJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMCategoryInfo")]];
    }
    

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introImageUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) totalTimeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) carTypeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) totalDistanceJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) routeStatusJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    
 

    + (NSValueTransformer*) routePropDetailsJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMRoutePropInfo")]];
    }
    
 

    + (NSValueTransformer*) poisJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMRoutePoiInfo")]];
    }
    
 

    + (NSValueTransformer*) linesJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMRouteLineInfo")]];
    }
    

@end
