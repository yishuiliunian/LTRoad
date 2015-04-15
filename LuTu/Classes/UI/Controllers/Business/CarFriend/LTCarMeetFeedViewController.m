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
@interface LTCarMeetFeedViewController ()
{
    NSArray* _allFeeds;
}
@end

@implementation LTCarMeetFeedViewController
static NSString* cellIdentifier = @"cellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[LTCarMeetFeedCell class] forCellReuseIdentifier:cellIdentifier];
    [self reloadAllData];
}

- (void) reloadAllData
{
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0 ; i < 10; i++) {
        LTUICarMeetFeed* feed = [LTUICarMeetFeed new];
        feed.carTitle = @"南山车友会";
        feed.postDate = @"12/2";
        feed.detail = @"我们从这里出发一直向西";
        feed.feedImageURL = [NSURL URLWithString:@"http://preview.quanjing.com/danita_rm008/us02-rbe0002.jpg"];
        [array addObject:feed];
    }
    _allFeeds = array;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allFeeds.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTCarMeetFeedCell* cell = (LTCarMeetFeedCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    LTUICarMeetFeed* feed = _allFeeds[indexPath.row];
    cell.carMeetFeed = feed;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
@end
