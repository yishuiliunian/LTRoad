
#import "__LTCarClubInfoShowReq.h"
#import <Mantle.h>
#import "PMCarClubInfo.h"
@implementation __LTCarClubInfoShowReq

- (NSString*) method
{
    return @"/car_club/info/show";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
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
        [self didGetMessage:[PMCarClubInfo new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        PMCarClubInfo* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMCarClubInfo") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMCarClubInfo*)message
{
   [self doUIOnSuccced:message];
}
@end
