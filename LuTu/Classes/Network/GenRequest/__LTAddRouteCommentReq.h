
#import "MSRequest.h"
#import "PMNullModel.h"
@interface __LTAddRouteCommentReq : MSRequest

@property(nonatomic,strong) NSString* content;

@property(nonatomic,strong) NSString* creatorId;

@property(nonatomic,strong) NSString* routeId;


- (void) didGetMessage:(PMNullModel*)message;
@end
    
