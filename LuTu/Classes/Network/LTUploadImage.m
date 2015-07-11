//
//  LTUploadImage.m
//  LuTu
//
//  Created by stonedong on 15/7/11.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUploadImage.h"
#import "LTGlobals.h"
#import <FCUUID.h>
@implementation LTUploadImage
- (instancetype) initWithImage:(UIImage *)image
{
    self = [super init];
    if (!self) {
        return self;
    }
    _image = image;
    _key = [FCUUID uuid];
    return self;
}
@end
