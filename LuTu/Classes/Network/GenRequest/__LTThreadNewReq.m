
#import "__LTThreadNewReq.h"
#import <Mantle.h>
#import "PMNullModel.h"
@implementation __LTThreadNewReq

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
[self addParamterArray:self.images subKey:@"imageId" forKey:@"images"];
[self addParamter:self.channel forKey:@"channel"];

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
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
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
