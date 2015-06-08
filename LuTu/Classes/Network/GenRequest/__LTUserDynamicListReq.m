
#import "__LTUserDynamicListReq.h"
#import <Mantle.h>
#import "PMUserDynamicListRsp.h"
@implementation __LTUserDynamicListReq

- (NSString*) method
{
    return @"/user/dynamic/list";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamterNumber:@(self.pageNo) forKey:@"pageNo"];
[self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
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
        [self didGetMessage:[PMUserDynamicListRsp new]];
    } else {
        if (retobject[@"list"]) {
            id object = retobject[@"list"];
            if ([object isKindOfClass:[NSString class]]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        PMUserDynamicListRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMUserDynamicListRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMUserDynamicListRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
