
#import "__LTRouteDetailReq.h"
#import <Mantle.h>
#import "PMRouteDetailRsp.h"
@implementation __LTRouteDetailReq

- (NSString*) method
{
    return @"/route/detail";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamter:self.userId forKey:@"userId"];
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
        [self didGetMessage:[PMRouteDetailRsp new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        PMRouteDetailRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMRouteDetailRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMRouteDetailRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
