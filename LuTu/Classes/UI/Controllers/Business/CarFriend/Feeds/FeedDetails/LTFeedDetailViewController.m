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
#import "LTThreadPostListReq.h"
#import "UIViewController+Additions.h"
#import "PMThreadPostListRsp.h"
#import <MWPhotoBrowser.h>
@interface LTFeedDetailViewController () <LTPostToolBarDelegate, MSRequestUIDelegate, MWPhotoBrowserDelegate>
{
    NSMutableDictionary* _allComments;
    LTFeedView* _headerFeedView;
    NSInteger _pageIndex;
    LTPostToolBar* _postToolBar;
    
    UISegmentedControl* _navTopSegmentControl;
    
    NSArray* _feedPhotos;
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

static NSString* const kLTThreadAll = @"全部";
static NSString* const KLTThreadLouZHu = @"楼主";
- (void) changedThreadOwner
{
    [self reloadCommentsAtIndex:1];
}
- (void) viewDidLoad
{
    [super viewDidLoad];
   
    _navTopSegmentControl = [[UISegmentedControl alloc] initWithItems:@[kLTThreadAll, KLTThreadLouZHu]];
    self.navigationItem.titleView = _navTopSegmentControl;
    _navTopSegmentControl.selectedSegmentIndex = 0;
    [_navTopSegmentControl addTarget:self action:@selector(changedThreadOwner) forControlEvents:UIControlEventValueChanged];
    
    //
    _allComments = [NSMutableDictionary new];
    self.hidesBottomBarWhenPushed = YES;
    [self initSubViews];

    [self.tableView registerClass:[LTCommentTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    self.tableView.backgroundColor = LTColorBackgroundGray();
    
    
    [self reloadCommentsAtIndex:1];
    [self reloadPostDetail];
    
    UIBarButtonItem* item = [self customBarButtonItemWithTarget:self selector:@selector(postComment) image:@"chat" highlightImage:@"chat"];
    self.navigationItem.rightBarButtonItem = item;
    
    [_headerFeedView.feedContentView addTarget:self action:@selector(showImages) forControlEvents:UIControlEventTouchUpInside];
}

- (void) showImages
{
    if (_feedPhotos.count) {
        MWPhotoBrowser* browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayNavArrows = NO; // Whether to display left and right nav arrows on toolbar (defaults to NO)
        browser.displaySelectionButtons = NO; // Whether selection buttons are shown on each image (defaults to NO)
        browser.zoomPhotosToFill = YES; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
        browser.alwaysShowControls = NO; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
        browser.enableGrid = NO; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
        browser.startOnGrid = NO; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
        browser.autoPlayOnAppear = NO; // Auto-play first video
        [browser setCurrentPhotoIndex:0];
        [self.navigationController pushViewController:browser animated:YES];
    }
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return _feedPhotos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < _feedPhotos.count) {
        return [_feedPhotos objectAtIndex:index];
    }
    return nil;
}

- (void) postComment
{
    
}

- (void) setCarFeedInfo:(LTUICarMeetFeed *)carFeedInfo
{
    if (_carFeedInfo != carFeedInfo) {
        _carFeedInfo = carFeedInfo;
        if ([self isViewLoaded]) {
            [self reloadPostDetail];
        }
        
        if (_carFeedInfo.images.count) {
            NSMutableArray* array = [NSMutableArray new];
            for (NSURL* str in _carFeedInfo.images) {
                MWPhoto* p = [MWPhoto photoWithURL:str];
                [array addObject:p];
            }
            _feedPhotos = array;
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
    [_headerFeedView.feedContentView.imageView loadRemoteURL:_carFeedInfo.feedImageURL placeHolderName:nil];
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
    cell.headerView.roleLabel.text = [NSString stringWithFormat:@"%d楼", indexPath.row + 1];
    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTUIComment* c = CURRENT_ALL_COMMENTS[indexPath.row];
    return c.height;
}

- (void) postToolBar:(LTPostToolBar *)toolbar didMoveToIndex:(int)index
{
    [self reloadCommentsAtIndex:index];
}
#pragma mark reload data

- (void) reloadCommentsAtIndex:(NSInteger)index
{
    LTThreadPostListReq* postListReq = [LTThreadPostListReq new];
    postListReq.threadId = _carFeedInfo.threadId;
    postListReq.pageNo = index;
    postListReq.pageSize = 5;
    
    if (_navTopSegmentControl.selectedSegmentIndex == 0) {
        postListReq.creatorId = nil;
    } else {
        postListReq.creatorId = self.carFeedInfo.threadInfo.creatorId;
    }
    MSPerformRequestWithDelegateSelf(postListReq);
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    LTThreadPostListReq* req = (LTThreadPostListReq*)request;
    NSInteger index = [(LTThreadPostListReq*)request pageNo];
    PMThreadPostListRsp* rsp = (PMThreadPostListRsp*)object;
    _pageIndex = index;
    _postToolBar.pageCount = ceil((double)rsp.total / req.pageSize);
//    _postToolBar.currentPageIndex = (int)rsp.offset;
    
    NSLog(@"------------%d",rsp.offset);
    
    NSMutableArray* comments = [NSMutableArray new];
    for (PMThreadPostInfo* info in rsp.list) {
        LTUIComment* c = [[LTUIComment alloc] initWithPMComment:info];
        [comments addObject:c];
    }
    _allComments[NUM_TO_STR(_pageIndex)] = comments;
    if (_pageIndex == 1) {
        self.tableView.tableHeaderView = _headerFeedView;
    } else {
        self.tableView.tableHeaderView = 0;
    }
    [self.tableView reloadData];
}
@end
