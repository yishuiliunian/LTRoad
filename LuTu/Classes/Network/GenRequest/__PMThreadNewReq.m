
#import "__PMThreadNewReq.h"
#import <Mantle.h>
#import "PMNullModel.h"
@implementation __PMThreadNewReq

- (NSString*) method
{
    return @"/thread/new";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamter:self.creatorId forKey:@"creatorId"];
[self addParamter:self.clubId forKey:@"clubId"];
[self addParamter:self.title forKey:@"title"];
[self addParamter:self.content forKey:@"content"];
[self addParamterNumber:@(self.images) forKey:@"images"];

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
