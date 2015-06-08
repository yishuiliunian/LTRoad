//
//  LTFeedDetailViewController.m
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTFeedDetailViewController.h"
#import "LTCommentTableViewCell.h"
#import "LTFeedView.h"
#import "LTGlobals.h"
#import "LTPostToolBar.h"
#import "LTUIComment.h"
#import "LTAdjustFrameTable.h"
@interface LTFeedDetailViewController () <LTPostToolBarDelegate>
{
    NSMutableDictionary* _allComments;
    LTFeedView* _headerFeedView;
    NSInteger _pageIndex;
    LTPostToolBar* _postToolBar;
}
@end

@implementation LTFeedDetailViewController
static NSString* const kCellIdentifier = @"kCellIdentifier";

- (void) loadView
{
    self.tableView = [LTAdjustFrameTable new];
    self.view = self.tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
- (void) reloadHeaderViewLayout
{
    _headerFeedView.frame = CGRectMake(0, 0, CGRectGetViewControllerWidth, _headerFeedView.adjustHeight);
    self.tableView.tableHeaderView = _headerFeedView;
}

- (void) initSubViews
{
    _headerFeedView = [LTFeedView new];
    [self reloadHeaderViewLayout];
    
    _postToolBar = [LTPostToolBar new];
    _postToolBar.delegate = self;
    
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    _allComments = [NSMutableDictionary new];
    self.hidesBottomBarWhenPushed = YES;
    [self initSubViews];

    [self.tableView registerClass:[LTCommentTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    self.tableView.backgroundColor = LTColorBackgroundGray();
    
    
    [self reloadCommentsAtIndex:0];
    [self reloadPostDetail];
}

- (void) setCarFeedInfo:(LTUICarMeetFeed *)carFeedInfo
{
    if (_carFeedInfo != carFeedInfo) {
        _carFeedInfo = carFeedInfo;
        if ([self isViewLoaded]) {
            [self reloadPostDetail];
        }
    }
}

- (void) reloadPostDetail
{
#define NUM_TO_STR(x) [@(x) stringValue]
    _headerFeedView.feedHeaderView.titleLabel.text = _carFeedInfo.title;
    [_headerFeedView.feedHeaderView.lookedCountButton setTitle:NUM_TO_STR(0) forState:UIControlStateNormal];
    [_headerFeedView.feedHeaderView.commentButton setTitle:NUM_TO_STR(_carFeedInfo.commentCount) forState:UIControlStateNormal];
    _headerFeedView.feedHeaderView.clubNickLabel.text = _carFeedInfo.carTitle;
    _headerFeedView.topicHeaderView.nickLabel.text = _carFeedInfo.ownerName;
    [_headerFeedView.topicHeaderView.avatarImageView  loadAvatarURL:_carFeedInfo.userAvatarURL];
    _headerFeedView.topicHeaderView.roleLabel.text = @"楼主";
    _headerFeedView.topicHeaderView.timeLabel.text = _carFeedInfo.postDate;
    _headerFeedView.feedContentView.contentLabel.text = _carFeedInfo.content;
    [_headerFeedView.feedContentView.imageView loadFeedBackgroundURL:_carFeedInfo.feedImageURL];
//
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
        self.navigationController.toolbarHidden = NO;
    [self.navigationController.toolbar addSubview:_postToolBar];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_postToolBar removeFromSuperview];
    self.navigationController.toolbarHidden = YES;
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _postToolBar.frame = self.navigationController.toolbar.bounds;
}
#pragma mark---
- (NSArray*) commnentsAtPage:(NSInteger)index
{
    return _allComments[[@(index) stringValue] ];
}
#define COMMENTS_AT_PAGE(p) [self commnentsAtPage:p]
#define CURRENT_ALL_COMMENTS COMMENTS_AT_PAGE(_pageIndex)
#pragma mark
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void) reloadCommentsAtPageNo:(NSInteger)interger
{
    
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return CURRENT_ALL_COMMENTS.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTCommentTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.comment = CURRENT_ALL_COMMENTS[indexPath.row];
    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTUIComment* c = CURRENT_ALL_COMMENTS[indexPath.row];
    return c.height;
}
#pragma mark reload data

- (void) reloadCommentsAtIndex:(NSInteger)index
{
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0 ; i < 40; i++) {
        LTUIComment* c = [[LTUIComment alloc] initWithPMComment:nil];
        [array addObject:c];
    }
    _allComments[NUM_TO_STR(index)] = array;
    [self.tableView reloadData];
}
@end
