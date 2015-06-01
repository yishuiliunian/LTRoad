//
//  LTRecommondReadDataController.m
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRecommondReadDataController.h"
#import "LTRecommendLine.h"
#import "LTGlobals.h"
#import "LTRecommondLineCell.h"
#import "LTRoadListReq.h"
#import "LTUserDataManager.h"
#import "LTNotificationTools.h"
@interface LTRecommondReadDataController () <MSRequestUIDelegate>

@end

@implementation LTRecommondReadDataController

- (void) dealloc
{
    LTRemoveObserverForCityReload(self);
}
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.objectMapCell = @{LTCellIdentifierFromClass([LTRecommendLine class]) : [LTRecommondLineCell class] };
    LTAddObserverForCityReload(self, @selector(reloadAllData));
    return self;
}

- (MSRequest<LTPageRequestProtocol>*) syncDataReqeust
{
    LTRoadListReq* req = [[LTRoadListReq alloc] init];
    req.cityId = LTShareSettings().currentCity;
    req.categoryName = self.category;
    req.name = self.keyword;
    return req;
}


- (void) decorateCell:(UITableViewCell *)cell withObject:(id)object
{
    LTRecommondLineCell* rCell = (LTRecommondLineCell*)cell;
    LTRecommendLine* line = (LTRecommendLine*)object;
    rCell.line = line;
}


@end
