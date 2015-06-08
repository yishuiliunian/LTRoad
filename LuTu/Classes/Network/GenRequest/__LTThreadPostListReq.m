
#import "__LTThreadPostListReq.h"
#import <Mantle.h>
#import "PMThreadPostListRsp.h"
@implementation __LTThreadPostListReq

- (NSString*) method
{
    return @"/thread/post/list";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamterNumber:@(self.pageNo) forKey:@"pageNo"];
[self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
[self addParamter:self.pageId forKey:@"pageId"];
[self addParamter:self.creatorId forKey:@"creatorId"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[PMThreadPostListRsp new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        PMThreadPostListRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMThreadPostListRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMThreadPostListRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
