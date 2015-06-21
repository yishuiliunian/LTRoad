
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"


@interface PMImageInfo : MTLModel <MTLJSONSerializing>
@property(nonatomic,assign) int64_t createTime;
@property(nonatomic,strong) NSString* imageId;
@property(nonatomic,strong) NSString* url;

@end
  
