
#import <Mantle.h>

@interface PMClubMember : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* memberType;
@property(nonatomic,strong) NSString* vihicleModel;
@property(nonatomic,strong) NSString* avatarUrl;

@end
  
