
#import <Mantle.h>

@interface PMFavoriteInfo : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* routeId;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* introImageUrl;
@property(nonatomic,assign) int64_t createTime;

@end
  
