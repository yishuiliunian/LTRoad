
#import <Mantle.h>

@interface PMCategory : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* categoryId;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* label;
@property(nonatomic,strong) NSString* introImageUrl;
@property(nonatomic,assign) int32_t routeCount;

@end
  
