//
//  LTFiles.h
//  LuTu
//
//  Created by stonedong on 15/4/26.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NSShareFileManager [NSFileManager defaultManager]


FOUNDATION_EXTERN void LTEnsurePathExist(NSString* path);
FOUNDATION_EXTERN NSString* LTDocumentsPath();
FOUNDATION_EXTERN NSString* LTSettingsFilePath();
