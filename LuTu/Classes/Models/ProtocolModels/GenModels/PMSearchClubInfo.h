
#import <Mantle.h>

@interface PMSearchClubInfo : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* carClubId;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* introText;
@property(nonatomic,strong) NSString* introImageUrl;
@property(nonatomic,assign) int32_t threadCount;
@property(nonatomic,assign) int32_t userCount;

@end
  
