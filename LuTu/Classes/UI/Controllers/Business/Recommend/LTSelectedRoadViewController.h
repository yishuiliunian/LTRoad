//
//  LTSelectedRoadViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTRecommondReadDataController.h"
@interface LTSelectedRoadViewController : UITableViewController
+ (instancetype) readViewControllerWithDataController:(LTPageDataController*)dataController;
- (instancetype) initWithDataController:(LTPageDataController*)dateController;
@end
