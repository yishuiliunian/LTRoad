//
//  LTUserDataManager.m
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUserDataManager.h"
#import <DZSingletonFactory.h>
#import "LTGlobals.h"
#import "LTFiles.h"
#import <CocoaLumberjack.h>
#import "LTLocationManager.h"
@implementation LTSettings
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(currentCity),
             };
}

- (void) setNilValueForKey:(NSString *)key
{
    [self setValue:@"" forKey:key];
}

- (NSString*) currentCity
{
    if (_currentCity) {
        return _currentCity;
    }
    NSString* city = LTShareLocationManger.currentCity;
    if (!city) {
        return @"深圳市";
    }
    return city;
}
@end

LTSettings* LTDefaultSettings()
{
    return [LTSettings new];
}

LTSettings* LTLoadSettingFromLocal ()
{
    NSError* error;
    NSData* data = [NSData dataWithContentsOfFile:LTSettingsFilePath()];
    if (!data) {
        return nil;
    }
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        DDLogError(@"%@", error);
        return nil;
    }
    if (dic) {
        NSError* error;
        LTSettings* settings = [[LTSettings alloc] initWithDictionary:dic error:&error];
        if (error) {
            DDLogError(@"%@",error);
        }
        return settings;
    }
    return nil;
}

LTSettings* LTShareSettings()
{
    static LTSettings* share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = LTLoadSettingFromLocal();
        if (!share) {
            share = LTDefaultSettings();
        }
    });
    return share;
}

void LTLocalizedSettings() {
    NSError* error = nil;
    NSDictionary* dic = [MTLJSONAdapter JSONDictionaryFromModel:LTShareSettings() error:&error];
    if (dic) {
        NSData* data = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        if (error) {
            DDLogError(@"%@",error);
            return;
        } else {
            BOOL ret = [data writeToFile:LTSettingsFilePath() atomically:YES];
            if (!ret) {
                DDLogError(@"写配置文件失败！");
            }
        }
        
    } else {
        DDLogError(@"配置文件写失败！");
    }
}

@implementation LTUserDataManager

+ (LTUserDataManager*) shareInstance
{
    return DZSingleForClass([self class]);
}

@end