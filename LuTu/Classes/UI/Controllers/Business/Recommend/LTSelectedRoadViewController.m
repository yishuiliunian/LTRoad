//
//  LTSelectedRoadViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTSelectedRoadViewController.h"
#import "LTRecommondLineCell.h"
@interface LTSelectedRoadViewController()
{
    NSArray* _recommondLines;
}
@end
@implementation LTSelectedRoadViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray* array = [NSMutableArray new];
    
    for (int i = 0 ; i < 10; i++) {
        LTRecommendLine* line = [LTRecommendLine new];
        line.createDate =  [NSDate date];
        line.tagBadgeItems = @[LTCreateBadgeItemWithText(@"路上")];
        line.distance = @"3.5KM";
        line.likeCount = 2;
        
        [array addObject:line];
    }
    _recommondLines = array;
    [self.tableView reloadData];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _recommondLines.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* const kCellIdentifier = @"recomondlinecell";
    LTRecommondLineCell* cell = (LTRecommondLineCell*)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (!cell) {
        cell = [[LTRecommondLineCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kCellIdentifier];
    }
    LTRecommendLine* line = _recommondLines[indexPath.row];
    cell.line = line;
    return cell;
}
@end
