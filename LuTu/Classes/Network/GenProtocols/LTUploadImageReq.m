
#import "LTUploadImageReq.h"

@implementation LTUploadImageReq

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    return YES;
}
- (void) willSendRequest:(NSMutableURLRequest *)request
{
    [request setHTTPMethod:@"POST"];
    [request setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
    
}
- (void) didGetMessage:(PMUploadImageRsp*)message
{

}
@end

