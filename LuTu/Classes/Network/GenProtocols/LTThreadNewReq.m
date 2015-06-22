
#import "LTThreadNewReq.h"

@implementation LTThreadNewReq
- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    self.channel = @"COMMON";
    SendSuperFunctionWithError(loadParamters);
    return YES;
}
- (void) didGetMessage:(PMNullModel*)message
{
    [self doUIOnSuccced:message];
}
@end

