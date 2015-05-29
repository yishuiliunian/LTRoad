
#import "PMFavoriteInfo.h"
@implementation PMFavoriteInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"routeId":@"routeId",
@"name":@"name",
@"introImageUrl":@"introImageUrl",
@"createTime":@"createTime",

            };
}

@end
