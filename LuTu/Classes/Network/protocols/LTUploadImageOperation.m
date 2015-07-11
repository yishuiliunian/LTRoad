//
//  LTUploadImageOperation.m
//  LuTu
//
//  Created by stonedong on 15/7/11.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUploadImageOperation.h"
#import <AFNetworking.h>
#import "MSRouter.h"

@interface LTUploadImageOperation ()
{
    BOOL _uploading;
}
@end
@implementation LTUploadImageOperation
- (instancetype) initWithImage:(LTUploadImage *)image
{
    self = [super init];
    if (!self) {
        return self;
    }
    _image = image;
    _uploading = NO;
    return self;
}
- (void) main
{
    @autoreleasepool {
        if (!_image) {
            return;
        }
        
        NSURL* URL= [MSShareRouter.baseURL URLByAppendingPathComponent:@"/server/image/upload"];
        
        NSData* data = UIImageJPEGRepresentation(_image.image, 0.5);
        AFHTTPRequestOperationManager * httpManager = [[AFHTTPRequestOperationManager alloc] init];
        [httpManager POST:URL.relativeString parameters:nil  constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileData:data name:@"imageFile" fileName:@"xx" mimeType:@"image/jpg"];
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
           
            NSDictionary* dic = (NSDictionary*)responseObject;
            _image.uploaded = YES;
            _image.imageURL = dic[@"result"][@"image_url"];
            _image.imageID = dic[@"result"][@"imageId"];
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([self.deleate respondsToSelector:@selector(uploadOperationSuccess:)]) {
                    [self.deleate uploadOperationSuccess:self];
                }
            });
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([self.deleate respondsToSelector:@selector(uploadOperation:uploadFaild:)]) {
                    [self.deleate uploadOperation:self uploadFaild:error];
                }
            });
            
        }];
        //
 
        while (_uploading) {
            [NSThread sleepForTimeInterval:0.1];
        }
        
        
    }
}
@end
