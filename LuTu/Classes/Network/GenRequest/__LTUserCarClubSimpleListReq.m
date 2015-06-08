
#import "__LTUserCarClubSimpleListReq.h"
#import <Mantle.h>
#import "PMUserCarClubSimpleRsp.h"
@implementation __LTUserCarClubSimpleListReq

- (NSString*) method
{
    return @"/user/car_club/simple/list";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamter:self.userId forKey:@"userId"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[PMUserCarClubSimpleRsp new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        PMUserCarClubSimpleRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMUserCarClubSimpleRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMUserCarClubSimpleRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
