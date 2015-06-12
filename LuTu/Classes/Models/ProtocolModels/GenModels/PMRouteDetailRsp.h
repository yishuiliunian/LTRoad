
#import <Mantle.h>
#import "PMCategoryInfo.h" 

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "PMRoutePropInfo.h" 

#import "PMRoutePoiInfo.h" 

#import "PMRouteLineInfo.h" 


@interface PMRouteDetailRsp : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSArray* categoryList;
@property(nonatomic,assign) BOOL isFav;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* introImageUrl;
@property(nonatomic,assign) int64_t favCount;
@property(nonatomic,strong) NSString* totalTime;
@property(nonatomic,strong) NSString* carType;
@property(nonatomic,strong) NSString* totalDistance;
@property(nonatomic,strong) NSString* routeStatus;
@property(nonatomic,strong) NSArray* routePropDetails;
@property(nonatomic,strong) NSArray* pois;
@property(nonatomic,strong) NSArray* lines;

@end
  
