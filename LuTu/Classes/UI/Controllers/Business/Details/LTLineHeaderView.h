//
//  LTLineHeaderView.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
#import "LTShowContentView.h"
#import "LTLineStartEndView.h"
#import "DZAdjustHeightTools.h"
#import "LTRouteInfoView.h"
extern const CGFloat LTLineHeaderCellHeight;
@interface LTLineHeaderView : UIView
@property (nonatomic, strong)  BMKMapView* mapView;
@property (nonatomic, strong, readonly) LTShowContentView* detailContentView;
@property (nonatomic, strong, readonly) LTLineStartEndView* startEndView;
@property (nonatomic, strong, readonly) LTRouteInfoView* routeInfoView;
@end
