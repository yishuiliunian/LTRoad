
#import <Mantle.h>

@interface PMCarClubInfo : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* carClubId;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* introText;
@property(nonatomic,strong) NSString* introImageUrl;
@property(nonatomic,strong) NSArray* memberList;

@end
  
