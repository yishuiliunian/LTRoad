
#import "__LTGetRouteCommentsReq.h"
#import <Mantle.h>
#import "PMGetRouteCommentsRsp.h"
@implementation __LTGetRouteCommentsReq

- (NSString*) method
{
    return @"/route/getRouteComment";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamterNumber:@(self.pageNo) forKey:@"pageNo"];
[self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
[self addParamter:self.routeId forKey:@"routeId"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[PMGetRouteCommentsRsp new]];
    } else {
        PMGetRouteCommentsRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMGetRouteCommentsRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMGetRouteCommentsRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
