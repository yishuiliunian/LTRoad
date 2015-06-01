
#import "__LTCategoryListReq.h"
#import <Mantle.h>
#import "PMCategoryListRsp.h"
@implementation __LTCategoryListReq

- (NSString*) method
{
    return @"/category/list";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamterNumber:@(self.pageNo) forKey:@"pageNo"];
[self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
[self addParamter:self.cityId forKey:@"cityId"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[PMCategoryListRsp new]];
    } else {
        PMCategoryListRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMCategoryListRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMCategoryListRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
