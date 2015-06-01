
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"


@interface PMUserSummaryRsp : MTLModel <MTLJSONSerializing>
@property(nonatomic,assign) int32_t clubMemberCount;
@property(nonatomic,assign) int32_t threadCount;
@property(nonatomic,strong) NSString* userName;

@end
  
