//
//  LTUploadImage.h
//  LuTu
//
//  Created by stonedong on 15/7/11.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@interface LTUploadImage : NSObject
@property (nonatomic, assign) BOOL uploaded;
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong) NSString* key;
@property (nonatomic, strong) NSString* imageURL;
@property (nonatomic, strong) NSString* imageID;

- (instancetype) initWithImage:(UIImage*)image;
@end
