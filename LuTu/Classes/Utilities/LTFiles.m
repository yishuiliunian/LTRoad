//
//  LTFiles.m
//  LuTu
//
//  Created by stonedong on 15/4/26.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTFiles.h"


void LTEnsurePathExist(NSString* path)
{
    NSCParameterAssert(path);
    BOOL exist = [NSShareFileManager fileExistsAtPath:path];
    if (!exist) {
        NSError* error = nil;
        [NSShareFileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
}

NSString* LTDocumentsPath()
{
    static NSString* documentsPath = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray* urls =  [NSShareFileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask];
        NSURL* url = urls[0];
        documentsPath = [url path];
        documentsPath = [documentsPath stringByAppendingPathComponent:@"TrackBugs"];
        LTEnsurePathExist(documentsPath);
    });
    return documentsPath;
}


NSString* LTSettingsFilePath()
{
    return [LTDocumentsPath() stringByAppendingPathComponent:@"settings.plist"];
}
