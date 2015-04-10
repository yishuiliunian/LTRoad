//
//  LTRecommendLine.h
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTBadgeItem.h"
@interface LTRecommendLine : NSObject
@property (nonatomic, strong) NSDate* createDate;
@property (nonatomic, strong) NSString* distance;
@property (nonatomic, strong) NSArray* tagBadgeItems;
@property (nonatomic, assign) int likeCount;
@end
