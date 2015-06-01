
#import "__LTUserInfoCompleteReq.h"
#import <Mantle.h>
#import "PMNullModel.h"
@implementation __LTUserInfoCompleteReq

- (NSString*) method
{
    return @"/user/info/complete";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamter:self.name forKey:@"name"];
[self addParamter:self.ctiy forKey:@"ctiy"];
[self addParamter:self.phone forKey:@"phone"];
[self addParamter:self.avatarUrl forKey:@"avatarUrl"];
[self addParamter:self.vehicleModel forKey:@"vehicleModel"];
[self addParamter:self.drivingYear forKey:@"drivingYear"];
[self addParamterNumber:@(self.oauthType) forKey:@"oauthType"];
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
        [self didGetMessage:[PMNullModel new]];
    } else {
        PMNullModel* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMNullModel") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMNullModel*)message
{
   [self doUIOnSuccced:message];
}
@end
