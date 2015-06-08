
#import <Mantle.h>
#import "PMUserNewsInfo.h" 


@interface PMUserDynamicListRsp : MTLModel <MTLJSONSerializing>
@property(nonatomic,assign) int64_t offset;
@property(nonatomic,assign) int64_t limit;
@property(nonatomic,assign) int64_t total;
@property(nonatomic,strong) NSArray* list;

@end
  
