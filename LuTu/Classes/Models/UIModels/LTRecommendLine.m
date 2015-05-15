//
//  LTRecommendLine.m
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRecommendLine.h"
#import "LTGlobals.h"
@implementation LTRecommendLine
- (instancetype) initWithNetworkModel:(PMRecommondLine *)pmModel
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.createDate =  [NSDate date];
    NSMutableArray* array = [NSMutableArray new];
    for (NSString* tag  in pmModel.category) {
        [array addObject:LTCreateBadgeItemWithText(tag)];
    }
    self.tagBadgeItems = array;
    self.distance = @"3.5KM";
    self.likeCount = pmModel.fav_count;
    self.backgroudImageURL = [NSURL URLWithString:pmModel.intro_image_url];
    self.title = pmModel.route_name;
    self.createDateString = @"2/14";
    self.routeID = pmModel.route_id;
    return self;
}
@end
