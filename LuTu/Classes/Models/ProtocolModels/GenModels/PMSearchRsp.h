
#import <Mantle.h>
#import "PMRouteSearchInfo.h" 

#import "PMClubSearchInfo.h" 

#import "PMThreadInfo.h" 


@interface PMSearchRsp : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSArray* routes;
@property(nonatomic,strong) NSArray* clubs;
@property(nonatomic,strong) NSArray* threads;

@end
  
