//
//  LTRouteDetailViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRouteDetailViewController.h"
#import "LTRouteDetailReq.h"
#import "LTRoutePOIReq.h"
#import "PMLine.h"
@interface LTRouteDetailViewController () <MSRequestUIDelegate>
{
    
}
@end
@implementation LTRouteDetailViewController

- (instancetype) initWithRouteID:(NSString *)routeID
{
    self = [super init];
    if (!self) {
        return self;
    }
    
    _routeID = routeID;
    
    return self;
}
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self reloadAllData];
}
- (void) reloadPOIS {
    LTRoutePOIReq* detailReq = [LTRoutePOIReq new];
    detailReq.routeID = _routeID;
    MSPerformRequestWithDelegateSelf(detailReq);
}

- (void) reloadDetails
{
    LTRouteDetailReq* detailReq = [LTRouteDetailReq new];
    detailReq.routeID = _routeID;
    MSPerformRequestWithDelegateSelf(detailReq);
}
- (void) reloadAllData
{
//    [self reloadDetails];
    [self reloadPOIS];
}

- (void) onHandleRemoteRoteDetail:(PMLine*)pmline
{
    
}

- (void) onHandleRemotePOIS:(NSArray*) pois
{
    
}
- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    if ([request isKindOfClass:[LTRoutePOIReq class]]) {
        [self onHandleRemotePOIS:object];
    } else if ([request isKindOfClass:[LTRouteDetailReq class]]) {
        [self onHandleRemoteRoteDetail:object];
    }
}
@end
