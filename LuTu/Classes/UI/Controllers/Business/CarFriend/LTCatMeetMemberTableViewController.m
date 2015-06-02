//
//  LTCatMeetMemberTableViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCatMeetMemberTableViewController.h"
#import "LTCarMenberTableViewCell.h"
@interface LTCatMeetMemberTableViewController ()
{

}
@end


static NSString* const kLTClubMemberCellIdentifier = @"kLTClubMemberCellIdentifier";
@implementation LTCatMeetMemberTableViewController
- (instancetype) initWithClubID:(NSString *)clubId
{
    self = [super init];
    if (!self) {
        return self;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[LTCarMenberTableViewCell class] forCellReuseIdentifier:kLTClubMemberCellIdentifier];
    [self reloadAllData];
}
- (void) setMembersControl:(LTCarMemberDataControl *)membersControl
{
    if (_membersControl != membersControl) {
        _membersControl = membersControl;
        [self reloadAllData];
    }
}
- (void) reloadAllData
{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _membersControl.managers.count;
    } else {
        return _membersControl.members.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LTCarMenberTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:kLTClubMemberCellIdentifier    forIndexPath:indexPath];
    
    LTUIClubMember* member = nil;
    if (indexPath.section == 0) {
        member = _membersControl.managers[indexPath.row];
    } else {
        member = _membersControl.members[indexPath.row];
    }
    cell.clubMember = member;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
