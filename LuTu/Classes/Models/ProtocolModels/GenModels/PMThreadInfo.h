
#import <Mantle.h>

@interface PMThreadInfo : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* threadId;
@property(nonatomic,strong) NSString* clubId;
@property(nonatomic,strong) NSString* title;
@property(nonatomic,strong) NSString* creatorId;
@property(nonatomic,assign) int32_t postCount;
@property(nonatomic,strong) NSString* carClubName;
@property(nonatomic,strong) NSString* userName;
@property(nonatomic,strong) NSString* userAvastarurl;
@property(nonatomic,strong) NSString* content;

@end
  
