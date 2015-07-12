//
//  LTAddUserInfoTableViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTAddUserInfoTableViewController.h"
#import "LTUserInfoTableViewCell.h"
#import "LTInputTableViewCell.h"
#import "LTColors.h"
#import <DZGeometryTools.h>
#import "MUAlertPool.h"
#import "LTUserInfoCompleteReq.h"
#import "LTGlobals.h"
@interface LTAddUserInfoTableViewController () <MSRequestUIDelegate>
{
    NSString* _nickName;
    UIButton* _completeButton;
}
@end

@implementation LTAddUserInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    
     _completeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_completeButton setBackgroundColor:LTColorButtonBlue()];
    [_completeButton setTitle:@"完成注册" forState:UIControlStateNormal];
    [_completeButton addTarget:self action:@selector(finishInput) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView* aView = [UIView new];
    CGRect rect = self.view.bounds;
    rect.size.height = 44;
    aView.frame = rect;
    [aView addSubview:_completeButton];
    
    _completeButton.layer.cornerRadius = CGRectGetHeight(rect)/2;
    //
    [_completeButton setTitleColor:LTColorDetailGray() forState:UIControlStateHighlighted];
    [_completeButton setTitleColor:LTColorDetailGray() forState:UIControlStateSelected];
    
    self.tableView.tableFooterView = aView;
    
    //
    self.title = @"个人资料";
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    CGRect rect = CGRectMake(0, 0, CGRectGetViewControllerWidth, 44);
    rect = CGRectCenterSubSize(rect, CGSizeMake(30, 0));
    _completeButton.frame = rect;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* key = [@(indexPath.row) stringValue];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:key ];
    if (!cell) {
        if (indexPath.row == 0) {
            cell = [[LTInputTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:key];
        } else {
            cell = [[LTUserInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:key];
        }
    }
    
    //
    cell.backgroundColor = LTColorBalckAlpha3();
    //
    if ([cell isKindOfClass:[LTUserInfoTableViewCell class]]) {
        LTUserInfoTableViewCell* infoCell = (LTUserInfoTableViewCell*)cell;
        infoCell.textLabel.textColor = [UIColor whiteColor];
        infoCell.detailTextLabel.textColor = LTColorDetailGray();
        if (indexPath.row == 1) {
            infoCell.textLabel.text = @"城市";
            infoCell.detailTextLabel.text = @"";
        }
    } else if ([cell isKindOfClass:[LTInputTableViewCell class]]) {
        LTInputTableViewCell* inputCell = (LTInputTableViewCell*)cell;
        inputCell.titleLable.text = @"昵称";
        inputCell.titleLable.textColor = [UIColor whiteColor];
        inputCell.textField.placeholder = @"请输入昵称";
        inputCell.textField.textColor = LTColorDetailGray();
        [inputCell.textField addTarget:self action:@selector(nickNameChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return cell;
}

- (UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* aView = [UIView new];
    aView.backgroundColor = [UIColor clearColor];
    return aView;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* aView = [UIView new];
    aView.backgroundColor = [UIColor clearColor];
    return aView;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}
- (void) nickNameChanged:(UITextField*)tx
{
    _nickName = tx.text;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void) finishInput
{
    if (!_nickName || [_nickName isEqualToString:@""]) {
        MUAlertShowError(@"请输入昵称");
        return;
    }
    
    LTAccount* account = LTCurrentAccount;
    LTUserInfo* userInfo = account.userInfo;
    LTUserInfoCompleteReq* req = [LTUserInfoCompleteReq new];
    req.name = _nickName;
    req.phone = userInfo.phone;
    req.ctiy = userInfo.city;
    req.avatarUrl = userInfo.avatarURL;
    req.drivingYear = userInfo.drivingYear;
    req.userId = account.accountID;
    MSPerformRequestWithDelegateSelf(req);

    MUAlertShowLoading(@"补充资料中。。。");
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    MUAlertShowError(error.localizedDescription);
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    MUAlertShowLoading(@"成功");
    [self ltAddUserInfoSuccess];
}
@end
