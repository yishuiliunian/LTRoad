
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "PMLinePoint.h"
#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"


@interface PMRoutePoiInfo : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* poiId;
@property(nonatomic,strong) NSString* routeId;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,assign) int32_t type;
@property(nonatomic,assign) BOOL cover;
@property(nonatomic,assign) int32_t routeIndex;
@property(nonatomic,strong) NSString* arrivalTime;
@property(nonatomic,strong) PMLinePoint* location;
@property(nonatomic,strong) NSString* introImageUrl;
@property(nonatomic,strong) NSString* introText;

@end
  
