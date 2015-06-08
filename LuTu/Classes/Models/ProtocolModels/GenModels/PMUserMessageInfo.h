
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"


@interface PMUserMessageInfo : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* messageId;
@property(nonatomic,strong) NSString* content;
@property(nonatomic,strong) NSString* userId;
@property(nonatomic,assign) int64_t createTime;

@end
  
