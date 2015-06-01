
#import "__LTCarClubInfoShowReq.h"
#import <Mantle.h>
#import "PMCategoryInfo.h"
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
        [self didGetMessage:[PMCategoryInfo new]];
    } else {
        PMCategoryInfo* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"PMCategoryInfo") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(PMCategoryInfo*)message
{
   [self doUIOnSuccced:message];
}
@end
