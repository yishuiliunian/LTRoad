//
//  LTUIPoi.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMPoiInfo.h"
#import "LTLinePointView.h"
@class LTLinePoiCell;
@interface LTUIPoi : NSObject

@property (nonatomic, strong ,readonly) PMPoiInfo* poiInfo;
@property (nonatomic, strong) Class cellClass;
@property (nonatomic, assign) CGFloat height;
- (instancetype) initWithPOI:(PMPoiInfo*)poi;

- (void) loadContentForCell:(LTLinePoiCell*)cell;
- (void) layoutContentViewForCell:(LTLinePoiCell*)cell;

@end
