
#import "__LTRoadListReq.h"
#import <Mantle.h>
#import "PMRouteListRsp.h"
@implementation __LTRoadListReq

- (NSString*) method
{
    return @"/route/list";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamterNumber:@(self.pageNo) forKey:@"pageNo"];
[self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
[self addParamter:self.cityId forKey:@"cityId"];
[self addParamter:self.name forKey:@"name"];
[self addParamter:self.categoryName forKey:@"categoryName"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[PMRouteListRsp new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        PMRouteListRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMRouteListRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMRouteListRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
