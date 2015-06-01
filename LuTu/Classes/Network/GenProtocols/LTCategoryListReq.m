
#import "LTCategoryListReq.h"
#import "LTUIDiscoverItem.h"
@implementation LTCategoryListReq
- (void) didGetMessage:(PMCategoryListRsp*)message
{
    NSMutableArray* outArray = [NSMutableArray new];
    for (PMCategoryInfo* c in message.list) {
        LTUIDiscoverItem* item = [[LTUIDiscoverItem alloc] initWithCategory:c];
        [outArray addObject:item];
    }
    [self doUIOnSuccced:[outArray copy]];
}
    
@end

