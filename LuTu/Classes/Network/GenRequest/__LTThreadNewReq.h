
#import "MSRequest.h"
#import "PMNullModel.h"
@interface __LTThreadNewReq : MSRequest

@property(nonatomic,strong) NSString* creatorId;

@property(nonatomic,strong) NSString* clubId;

@property(nonatomic,strong) NSString* title;

@property(nonatomic,strong) NSString* content;

@property(nonatomic,strong) NSString* images;

@property(nonatomic,strong) NSString* channel;


- (void) didGetMessage:(PMNullModel*)message;
@end
    
