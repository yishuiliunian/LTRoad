
#import "PMThreadInfo.h"
@implementation PMThreadInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"threadId":@"threadId",
@"clubId":@"clubId",
@"title":@"title",
@"creatorId":@"creatorId",
@"postCount":@"postCount",
@"carClubName":@"carClubName",
@"userName":@"userName",
@"userAvastarurl":@"userAvastarurl",
@"content":@"content",

            };
}

@end
