//
//  LTUPloadImageManager.m
//  LuTu
//
//  Created by stonedong on 15/7/11.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUPloadImageManager.h"
#import <DZSingletonFactory.h>
#import "LTUploadImageOperation.h"
@interface LTUPloadImageManager() <LTUploadImageDelegate>
{
    NSOperationQueue* _uploadQueue;
    int _uploadingCount;
    NSMutableArray* _allUploadImages;
}
@end
@implementation LTUPloadImageManager
+ (LTUPloadImageManager*) shareManager
{
    return DZSingleForClass([LTUPloadImageManager class]);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _uploadQueue = [NSOperationQueue new];
        _allUploadImages = [NSMutableArray new];
    }
    return self;
}
- (BOOL) uploading
{
    return _uploadingCount != 0;
}
- (void) uploadOperationSuccess:(LTUploadImageOperation *)op
{
    _uploadingCount--;
    if (_uploadingCount == 0) {
        if ([self.delgate respondsToSelector:@selector(uploadManagerSuccess:)]) {
            [self.delgate uploadManagerSuccess:self];
        }
    }
}

- (void) uploadOperation:(LTUploadImageOperation *)op uploadFaild:(NSError *)error
{
    _uploadingCount--;
    [_uploadQueue cancelAllOperations];
    if ([self.delgate respondsToSelector:@selector(uploadManager:uploadError:)]) {
        [self.delgate uploadManager:self uploadError:error];
    }
}

- (NSArray*) allImages
{
    return [_allUploadImages copy];
}
- (void) uploadImage:(LTUploadImage *)image
{
    if (!image) {
        return ;
    }
    
    [_allUploadImages addObject:image];
    
    _uploadingCount++;
    LTUploadImageOperation* op = [[LTUploadImageOperation alloc] initWithImage:image];
    op.deleate = self;
    [_uploadQueue addOperation:op];
}
@end
