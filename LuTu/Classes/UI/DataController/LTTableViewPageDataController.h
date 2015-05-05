//
//  LTTableViewPageDataController.h
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTPageDataController.h"

@interface LTTableViewPageDataController : LTPageDataController <UITableViewDataSource>
@property (nonatomic, strong) NSDictionary* objectMapCell;
@property (nonatomic, strong) UITableView* tableView;
- (void) decorateCell:(UITableViewCell*)cell withObject:(id)object;
@end
