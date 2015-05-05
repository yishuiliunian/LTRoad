//
//  LTPageTableViewController.h
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTTableViewPageDataController.h"
@interface LTPageTableViewController : UITableViewController
@property (nonatomic, strong, readonly) LTTableViewPageDataController* dataController;
- (instancetype) initWithDataController:(LTTableViewPageDataController*)dataController;
@end
