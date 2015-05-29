
#import "PMThreadPostInfo.h"
@implementation PMThreadPostInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"postId":@"postId",
@"threadId":@"threadId",
@"content":@"content",
@"createTime":@"createTime",
@"creatorName":@"creatorName",
@"creatorAvatarUrl":@"creatorAvatarUrl",

            };
}

@end
