
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "PMLinePoint.h"
#import "PMRouteCategoryInfo.h" 


@interface PMRouteInfo : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* routeId;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* introImageUrl;
@property(nonatomic,assign) int32_t favCount;
@property(nonatomic,strong) PMLinePoint* location;
@property(nonatomic,strong) NSArray* categoryList;

@end
  
