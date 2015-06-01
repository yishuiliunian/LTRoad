
#import "__LTCarClubMemberQuitReq.h"
#import <Mantle.h>
#import "PMNullModel.h"
@implementation __LTCarClubMemberQuitReq

- (NSString*) method
{
    return @"/car_club/member/quit";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamter:self.userId forKey:@"userId"];
[self addParamter:self.carClubId forKey:@"carClubId"];

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
