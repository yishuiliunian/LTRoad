//
//  LTUploadImageOperation.h
//  LuTu
//
//  Created by stonedong on 15/7/11.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "LTUploadImage.h"
@class LTUploadImageOperation;
@protocol LTUploadImageDelegate <NSObject>

- (void) uploadOperation:(LTUploadImageOperation*)op uploadFaild:(NSError*)error;
- (void) uploadOperationSuccess:(LTUploadImageOperation *)op;
@end

@interface LTUploadImageOperation : NSOperation
@property (nonatomic, strong, readonly) LTUploadImage* image;
@property (nonatomic, weak) id<LTUploadImageDelegate> deleate;
- (instancetype) initWithImage:(LTUploadImage*)image;
@end
