//
//  LTLineHeaderView.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Baidu-Maps-iOS-SDK/BMapKit.h>
#import "LTShowContentView.h"
#import "LTLineStartEndView.h"
extern const CGFloat LTLineHeaderCellHeight;
@interface LTLineHeaderView : UIView
@property (nonatomic, strong)  BMKMapView* mapView;
@property (nonatomic, strong, readonly) LTShowContentView* detailContentView;
@property (nonatomic, strong, readonly) LTLineStartEndView* startEndView;
@end
