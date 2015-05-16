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
#import "LTPostDetail.h"
#import "LTGlobals.h"
#import "LTPostToolBar.h"
#import "LTUIComment.h"
@interface LTFeedDetailViewController () <LTPostToolBarDelegate>
{
    NSMutableDictionary* _allComments;
    LTFeedView* _headerFeedView;
    NSInteger _pageIndex;
    LTPostToolBar* _postToolBar;
}
@property (nonatomic, strong) LTPostDetail* postDetail;
@end

@implementation LTFeedDetailViewController
static NSString* const kCellIdentifier = @"kCellIdentifier";
- (void) dealloc
{
    [_headerFeedView removeObserver:self forKeyPath:@"height"];
}
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _headerFeedView && [keyPath isEqualToString:@"height"]) {
        [self reloadHeaderViewLayout];
    }
}
- (void) reloadHeaderViewLayout
{
    _headerFeedView.frame = CGRectMake(0, 0, CGRectGetViewControllerWidth, _headerFeedView.height);
    self.tableView.tableHeaderView = _headerFeedView;
    

}

- (void) initSubViews
{
    _headerFeedView = [LTFeedView new];
    [self reloadHeaderViewLayout];
    ADD_OBSERVER_TO_HEIGHT(_headerFeedView);
    
    _postToolBar = [LTPostToolBar new];
    _postToolBar.delegate = self;
    
}
- (void) fakeData
{
    LTPostDetail* post = [LTPostDetail new];
    post.title = @"我们一路向西，知道走到了这条路的尽头，再也看不到远方的时候。";
    post.dateString = @"2o11-33";
    post.owerName = @"流年";
    post.lookedCount = 3;
    post.commentCount = 5;
    post.contentText = @"我们一路向西，知道走到了这条路的尽头，再也看不到远方的时候。我们一路向西，知道走到了这条路的尽头，再也看不到远方的时候。我们一路向西，知道走到了这条路的尽头，再也看不到远方的时候。我们一路向西，知道走到了这条路的尽头，再也看不到远方的时候。我们一路向西，知道走到了这条路的尽头，再也看不到远方的时候。我们一路向西，知道走到了这条路的尽头，再也看不到远方的时候。";
    post.role = @"楼主";
    post.clubName = @"卡宴";
    self.postDetail = post;
}
- (void) viewDidLoad
{
    [super viewDidLoad];
    _allComments = [NSMutableDictionary new];
    self.hidesBottomBarWhenPushed = YES;
    [self initSubViews];

    [self.tableView registerClass:[LTCommentTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    self.tableView.backgroundColor = LTColorBackgroundGray();
    
#ifdef DEBUG
    [self fakeData];
#endif
    
    [self reloadCommentsAtIndex:0];
}

- (void) setPostDetail:(LTPostDetail *)postDetail
{
    if (_postDetail != postDetail) {
        _postDetail = postDetail;
        [self reloadPostDetail];
    }
}
- (void) reloadPostDetail
{
#define NUM_TO_STR(x) [@(x) stringValue]
    _headerFeedView.feedHeaderView.titleLabel.text = _postDetail.title;
    [_headerFeedView.feedHeaderView.lookedCountButton setTitle:NUM_TO_STR(_postDetail.lookedCount) forState:UIControlStateNormal];
    [_headerFeedView.feedHeaderView.commentButton setTitle:NUM_TO_STR(_postDetail.commentCount) forState:UIControlStateNormal];
    _headerFeedView.feedHeaderView.clubNickLabel.text = _postDetail.clubName;
    _headerFeedView.topicHeaderView.nickLabel.text = _postDetail.owerName;
    [_headerFeedView.topicHeaderView.avatarImageView  loadAvatarURL:_postDetail.avatarImageURL];
    _headerFeedView.topicHeaderView.roleLabel.text = @"楼主";
    _headerFeedView.topicHeaderView.timeLabel.text = _postDetail.dateString;
    _headerFeedView.feedContentView.contentLabel.text = _postDetail.contentText;
    [_headerFeedView.feedContentView.imageView loadFeedBackgroundURL:_postDetail.contentImageURL];
    
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
