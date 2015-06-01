
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"


@interface PMClubSearchInfo : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* club_id;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,assign) int32_t member_count;
@property(nonatomic,assign) int32_t thread_count;

@end
  
