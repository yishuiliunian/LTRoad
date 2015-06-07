//
//  LTMyFavoriteDataController.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyFavoriteDataController.h"
#import "LTGlobals.h"
#import "LTSearchRouteTableViewCell.h"
#import "LTUserFavoriteRouteListReq.h"
#import "LTUIRouteSearchInfo.h"
#import "LKHaneke.h"
@implementation LTMyFavoriteDataController
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.objectMapCell = @{LTCellMapPairWithClass( LTUIRouteSearchInfo,LTSearchRouteTableViewCell)};
    return self;
}

- (MSRequest<LTPageRequestProtocol>*) syncDataReqeust
{
    LTUserFavoriteRouteListReq* req = [LTUserFavoriteRouteListReq new];
    req.userId = LTCurrentAccount.accountID;
    return req;
}

- (NSString*) identifyForObject:(id)object
{
    if ([object isKindOfClass:[LTUIRouteSearchInfo class]]) {
        return [(LTUIRouteSearchInfo*)object routeId];
    }
    return nil;
}

- (void) decorateCell:(UITableViewCell *)cell withObject:(id)object
{
    LTSearchRouteTableViewCell* fCell = (LTSearchRouteTableViewCell*)cell;
    LTUIRouteSearchInfo* fdata = (LTUIRouteSearchInfo*)object;
    fCell.routeInfo = fdata;
}
@end
