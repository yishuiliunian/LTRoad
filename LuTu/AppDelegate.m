//
//  AppDelegate.m
//  LuTu
//
//  Created by stonedong on 15/3/25.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "LTGlobalViewController.h"
#import "LTConfigure.h"
#import <DZImageCache.h>
#import "SAReqManager.h"
#import <BaiduMapAPI/BMapKit.h>
#import "LTLocationManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    LTApplicationSetup();
    LTGlobalViewController* globalVC = [LTGlobalViewController new];
    _globalViewController = globalVC;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = globalVC;
    //
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [BMKMapView willBackGround];//当应用即将后台时调用，停止一切调用opengl相关的操作
    [LTShareLocationManger stopUpdateLocation];
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [BMKMapView didForeGround];//当应用恢复前台状态时调用，回复地图的渲染和opengl相关的操作
    [LTShareLocationManger startUpdateLocation];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if ([[SAReqManager shareManager] canHandleURL]) {
        [[SAReqManager shareManager] handleURL:url];
    }
    
    return YES;
}

- (BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([[SAReqManager shareManager] canHandleURL]) {
        [[SAReqManager shareManager] handleURL:url];
    }
    
    return YES;
}
@end
