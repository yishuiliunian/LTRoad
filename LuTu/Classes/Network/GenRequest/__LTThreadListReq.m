
#import "__LTThreadListReq.h"
#import <Mantle.h>
#import "PMThreadListRsp.h"
@implementation __LTThreadListReq

- (NSString*) method
{
    return @"/thread/list";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamterNumber:@(self.pageNo) forKey:@"pageNo"];
[self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
[self addParamter:self.carClubId forKey:@"carClubId"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[PMThreadListRsp new]];
    } else {
        PMThreadListRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMThreadListRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMThreadListRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
