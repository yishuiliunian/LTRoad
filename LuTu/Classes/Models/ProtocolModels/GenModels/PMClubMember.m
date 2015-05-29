
#import "PMClubMember.h"
@implementation PMClubMember
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"name":@"name",
@"memberType":@"memberType",
@"vihicleModel":@"vihicleModel",
@"avatarUrl":@"avatarUrl",

            };
}

@end
