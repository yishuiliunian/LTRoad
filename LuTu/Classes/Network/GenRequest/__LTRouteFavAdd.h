
#import "MSRequest.h"
#import "PMNullModel.h"
@interface __LTRouteFavAdd : MSRequest

@property(nonatomic,strong) NSString* creatorId;

@property(nonatomic,strong) NSString* routeId;


- (void) didGetMessage:(PMNullModel*)message;
@end
    
