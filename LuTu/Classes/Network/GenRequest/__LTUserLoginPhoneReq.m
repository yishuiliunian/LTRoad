
#import "__LTUserLoginPhoneReq.h"
#import <Mantle.h>
#import "PMTokenAuthRsp.h"
@implementation __LTUserLoginPhoneReq

- (NSString*) method
{
    return @"/user/loginPhone";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamter:self.phone forKey:@"phone"];
[self addParamter:self.password forKey:@"password"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[PMTokenAuthRsp new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        PMTokenAuthRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMTokenAuthRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMTokenAuthRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
