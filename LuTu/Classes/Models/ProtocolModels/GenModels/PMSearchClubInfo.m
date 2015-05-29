
#import "PMSearchClubInfo.h"
@implementation PMSearchClubInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"carClubId":@"carClubId",
@"name":@"name",
@"introText":@"introText",
@"introImageUrl":@"introImageUrl",
@"threadCount":@"threadCount",
@"userCount":@"userCount",

            };
}

@end
