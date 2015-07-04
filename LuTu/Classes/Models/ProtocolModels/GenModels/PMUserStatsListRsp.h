
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"


@interface PMUserStatsListRsp : MTLModel <MTLJSONSerializing>
@property(nonatomic,assign) int32_t clubMemberCount;
@property(nonatomic,assign) int32_t threadCount;
@property(nonatomic,strong) NSString* userName;
@property(nonatomic,assign) int32_t dynamicCount;
@property(nonatomic,strong) NSString* message;
@property(nonatomic,assign) int32_t messageCount;
@property(nonatomic,assign) int32_t status;

@end
  
