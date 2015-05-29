
#import "PMCategory.h"
@implementation PMCategory
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"categoryId":@"categoryId",
@"name":@"name",
@"label":@"label",
@"introImageUrl":@"introImageUrl",
@"routeCount":@"routeCount",

            };
}

@end
