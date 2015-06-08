//
//  LTCarMeetFeedViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetFeedViewController.h"
#import "LTCarMeetFeedCell.h"
#import "LTUICarMeetFeed.h"
#import "LTFeedDetailViewController.h"
@interface LTCarMeetFeedViewController ()
{
    NSArray* _allFeeds;
}
@end

@implementation LTCarMeetFeedViewController
static NSString* cellIdentifier = @"cellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTUICarMeetFeed* feed = [self.dataController objectAtIndex:indexPath.row];
    LTFeedDetailViewController* detailVC = [LTFeedDetailViewController new];
    detailVC.hidesBottomBarWhenPushed = YES;
    detailVC.carFeedInfo = feed;
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
