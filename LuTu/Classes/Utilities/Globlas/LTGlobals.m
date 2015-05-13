//
//  LTGlobals.m
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTGlobals.h"


NSString* LTCellIdentifierFromClass(Class cla) {
    return NSStringFromClass(cla);
}




static NSString* const kLTSeperateKey = @",";

NSArray* LTSpereateStringToArray(NSString* str) {
    NSArray* array = [str componentsSeparatedByString:kLTSeperateKey];
    return array;
}


NSString* LTApplicationVersion()
{
    static NSString* version = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary* infoDict =[[NSBundle mainBundle] infoDictionary];
        version =[infoDict objectForKey:@"CFBundleVersion"];
    });
    return version;
}