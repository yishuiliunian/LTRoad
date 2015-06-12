//
//  LTRecommendLine.m
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRecommendLine.h"
#import "LTGlobals.h"
#import "PMRouteInfo.h"
#import "LTTagColorManager.h"
#import "LTLocationManager.h"
@implementation LTRecommendLine
- (instancetype) initWithNetworkModel:(PMRouteInfo*)pmModel
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.createDate =  [NSDate date];
    NSMutableArray* array = [NSMutableArray new];
    for (PMRouteCategoryInfo* info in pmModel.categoryList) {
        LTBadgeItem* item = LTCreateBadgeItemWithText(info.name);
        [[LTTagColorManager shareInstance] registerColor:info.color forKey:info.name];
        [array addObject:item];
    }
    self.tagBadgeItems = array;
    self.distance = [[LTLocationManager shareManager] userDistanceToPoint:pmModel.location];
    self.likeCount = pmModel.favCount;
    self.backgroudImageURL = STR_TO_URL(pmModel.introImageUrl);
    self.title = pmModel.name;
    self.createDateString = @"2/14";
    self.routeID =  pmModel.routeId;
    [self caluateLayouts];
    return self;
}

- (void) caluateLayouts
{
    _distanceUIWidth = [self.distance sizeWithFont:LTFontDetail() constrainedToSize:CGSizeMake(1000, 10000)].width;
}
@end
