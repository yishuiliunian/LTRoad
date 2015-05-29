
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
 

    + (NSValueTransformer*) memberListJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMClubMember")]];
    }
    

@end
