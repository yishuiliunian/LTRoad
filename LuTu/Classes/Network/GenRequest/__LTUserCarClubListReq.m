
#import "__LTUserCarClubListReq.h"
#import <Mantle.h>
#import "PMUserClubListRsp.h"
@implementation __LTUserCarClubListReq

- (NSString*) method
{
    return @"/user/car_club/list";
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
        [self didGetMessage:[PMUserClubListRsp new]];
    } else {
        PMUserClubListRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMUserClubListRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMUserClubListRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
