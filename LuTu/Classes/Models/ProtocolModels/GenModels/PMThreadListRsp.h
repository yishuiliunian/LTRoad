
#import <Mantle.h>
#import "PMThreadInfo.h" 


@interface PMThreadListRsp : MTLModel <MTLJSONSerializing>
@property(nonatomic,assign) int32_t offset;
@property(nonatomic,assign) int32_t limit;
@property(nonatomic,assign) int32_t total;
@property(nonatomic,strong) NSArray* list;

@end
  
