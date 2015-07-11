//
//  LTUPloadImageManager.h
//  LuTu
//
//  Created by stonedong on 15/7/11.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTUploadImage.h"
@import UIKit;
@class LTUPloadImageManager;
@protocol LTUploadManagerDelegate <NSObject>

- (void) uploadManager:(LTUPloadImageManager*)m uploadError:(NSError*)error;
- (void) uploadManagerSuccess:(LTUPloadImageManager*)m;
@end

@interface LTUPloadImageManager : NSObject
@property (nonatomic, strong, readonly) NSArray* allImages;
@property (nonatomic, weak) id<LTUploadManagerDelegate> delgate;
@property (nonatomic, assign, readonly) BOOL uploading;
- (void) uploadImage:(LTUploadImage*)image;
@end
