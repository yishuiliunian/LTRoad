//
//  LTGlobals.m
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTGlobals.h"

#import <DateTools.h>
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


NSURL* LTNSURLFromString(NSString* string) {
    return [NSURL URLWithString:string];
}


NSTimeInterval LTDefaultTimeStamp()
{
    return [[NSDate date] timeIntervalSince1970];
}

UInt64 LTAlignTimeStamp(NSTimeInterval interval) {
    return floor(interval);
}

NSTimeInterval LTUnAlgnTimeStamp(int64_t time) {
    return (NSTimeInterval) time / 1000;
}

UInt64 LTCurrentTimeStamp()
{
    return LTAlignTimeStamp(LTDefaultTimeStamp());
}



NSDate* LTDateFromServerTimeInterval(int64_t time) {
    return [NSDate dateWithTimeIntervalSince1970:LTUnAlgnTimeStamp(time)];
}

NSString* LTDateShortStringFromInterval(int64_t time) {
    return [LTDateFromServerTimeInterval(time) formattedDateWithFormat:@"yyyy-mm-dd"];
}

NSString*  ENSURE_STR(id object) {
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    }
    else if ([object isKindOfClass:[NSNumber class]]) {
        return [object stringValue];
    } else {
        return [NSString stringWithFormat:@"%@",object];
    }
    
}

NSString* TIME_TO_STR(int64_t timeStamp)
{
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [date  formattedDateWithStyle:NSDateFormatterMediumStyle];
}