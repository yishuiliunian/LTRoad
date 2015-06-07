//
//  LTPageTableViewController.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTPageTableViewController.h"

@interface LTPageTableViewController ()
{
    BOOL _needUpdateDataControllerTableView;
}

@end

@implementation LTPageTableViewController
@synthesize dataController = _dataController;


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype) initWithDataController:(LTTableViewPageDataController *)dataController
{
    self = [super init];
    if (!self) {
        return self;
    }
    [self setDataController:dataController];
    return self;
}
- (void) configureView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor clearColor];
}


- (void) setDataController:(LTTableViewPageDataController *)dataController
{
    if (_dataController != dataController) {
        _dataController = dataController;
        _dataController.tableViewController = self;
        if (self.isViewLoaded) {
            _dataController.tableView = self.tableView;
            _needUpdateDataControllerTableView = NO;
        } else
        {
            _needUpdateDataControllerTableView = YES;
        }
    }
}
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    if (_needUpdateDataControllerTableView) {
        _dataController.tableView = self.tableView;
        _needUpdateDataControllerTableView = NO;
    }
    [_dataController reloadAllData];
}

@end
