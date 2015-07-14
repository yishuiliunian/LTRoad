//
//  LTLocationManager.m
//  LuTu
//
//  Created by stonedong on 15/4/26.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTLocationManager.h"
#import <DZSingletonFactory.h>
#import "PMLinePoint.h"
#import <BaiduMapAPI/BMapKit.h>
@interface LTLocationManager () <CLLocationManagerDelegate>
{
    PMLinePoint* _currentPoint;
    BMKMapManager* _mapManager;
    CLLocationManager* _locationManager;
}
@end
@implementation LTLocationManager
+ (LTLocationManager*) shareManager
{
    return DZSingleForClass([self class]);
}

- (void) storeCurrentPoint
{
    NSError* error = nil;
    if (!_currentPoint) {
        return;
    }
    NSDictionary* dic = [_currentPoint dictionaryValue];
    if (!dic) {
        return;
    }
    NSData* data = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
    if (!data) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"point"];
}

- (PMLinePoint*) reloadStoredPoint
{
    NSData* data = [[NSUserDefaults standardUserDefaults] dataForKey:@"point"];
    if (!data) {
        return [PMLinePoint defaultPoint];
    }
    NSError* error = nil;
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (!dic) {
        return [PMLinePoint defaultPoint];
    }
    PMLinePoint* point = [MTLJSONAdapter modelOfClass:[PMLinePoint class] fromJSONDictionary:dic error:&error];
    if (!point) {
        return [PMLinePoint defaultPoint];
    }
    return point;
}

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _currentPoint = [self reloadStoredPoint];
    _mapManager =  [[BMKMapManager alloc] init];
    return self;
}
- (void) setup
{
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8) {
        //由于IOS8中定位的授权机制改变 需要进行手动授权
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        //获取授权认证
        if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorized) {
            [_locationManager requestAlwaysAuthorization];
            [_locationManager requestWhenInUseAuthorization];
        }
    }
}

- (void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    BOOL ret =  [ _mapManager  start:@"oorRwxz7etP9d75hdd4M9uMQ" generalDelegate:nil];
    if (!ret) {
        NSLog(@",,,,,,,,,,map init faild");
    }
    [self setCurrentLocation:manager.location];
}

- (NSString*) userDistanceToPoint:(PMLinePoint*)point
{
    BMKMapPoint pUser = BMKMapPointMake(_currentPoint.lat, _currentPoint.lng);
    CLLocationCoordinate2D loc = {point.lat, point.lng};
    BMKMapPoint pAim =  BMKMapPointForCoordinate(loc);
    
    CLLocationDistance disctance = BMKMetersBetweenMapPoints(pUser, pAim);
    return [NSString stringWithFormat:@"%.2f千米",disctance/1000];
}

- (void) setCurrentLocation:(CLLocation*)loc
{
    PMLinePoint* linePoint = [[PMLinePoint alloc] init];
    BMKMapPoint point = BMKMapPointForCoordinate(loc.coordinate);
    linePoint.lat = point.x;
    linePoint.lng = point.y;
    _currentPoint = linePoint;
    [self storeCurrentPoint];
}
- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if (locations.count) {
        CLLocation* loc = locations.firstObject;
        [self setCurrentLocation:loc];
    }
}

- (void) startUpdateLocation
{
    [_locationManager startUpdatingLocation];
}

- (void) stopUpdateLocation
{
    [_locationManager stopUpdatingLocation];
}
@end
