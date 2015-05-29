
#import <Mantle.h>

@interface PMThreadPostInfo : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* postId;
@property(nonatomic,strong) NSString* threadId;
@property(nonatomic,strong) NSString* content;
@property(nonatomic,assign) int64_t createTime;
@property(nonatomic,strong) NSString* creatorName;
@property(nonatomic,strong) NSString* creatorAvatarUrl;

@end
  
