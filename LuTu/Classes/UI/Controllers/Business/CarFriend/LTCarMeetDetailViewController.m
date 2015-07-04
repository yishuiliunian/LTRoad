//
//  LTCarMeetDetailViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetDetailViewController.h"
#import "LTCatMeetMemberTableViewController.h"
#import "LTCarMeetFeedViewController.h"
#import "LTCarMeetInfoViewController.h"
#import "LTCarMeetTopView.h"
#import "LTCarClubInfoShowReq.h"
#import "PMCarClubInfo.h"
#import "LTUIClubMember.h"
#import "LTCarMeetFeedDataController.h"
@interface LTCarMeetDetailViewController () <MSRequestUIDelegate>
{
    DZSwipeViewController* _swipViewController;
    LTCarMeetTopView* _topView;
    LTCatMeetMemberTableViewController* _membersViewController;
    LTCarMeetInfoViewController* _clubInfoViewController;
    LTCarMeetFeedViewController* _threadsViewController;
}
@end

@implementation LTCarMeetDetailViewController

- (instancetype) initWithCarClub:(LTUICarMeet *)carClub
{
    self = [super init];
    if (!self) {
        return self;
    }
    _carClub = carClub;
    return self;
}
- (void) lt_addViewController:(UIViewController*)vc
{
    [vc willMoveToParentViewController:self];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = self.view.bounds;
    [vc didMoveToParentViewController:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _clubInfoViewController = [LTCarMeetInfoViewController new];
    _clubInfoViewController.swipeTitle = @"简介";
    
    _membersViewController= [LTCatMeetMemberTableViewController new];
    _membersViewController.swipeTitle = @"成员";

    LTCarMeetFeedDataController* dataController  = [ LTCarMeetFeedDataController new];
    dataController.carMeet = _carClub;
    _threadsViewController= [[LTCarMeetFeedViewController alloc] initWithDataController:dataController];
    _threadsViewController.swipeTitle = @"动态";
    _swipViewController = [[DZSwipeViewController alloc] initWithViewControllers:@[_membersViewController, _threadsViewController, _clubInfoViewController]];
    //
    _topView = [[LTCarMeetTopView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    _swipViewController.topView = _topView;
    //
    [self lt_addViewController:_swipViewController];
    
    [self reloadAllData];
    
}

- (void) reloadAllData
{
    LTCarClubInfoShowReq* req = [LTCarClubInfoShowReq new];
    req.carClubId = _carClub.clubID;
    MSPerformRequestWithDelegateSelf(req);
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    PMCarClubInfo* clubInfo = (PMCarClubInfo*)object;
    LTCarMemberDataControl* memberControl = [LTCarMemberDataControl new];
    NSMutableArray* managers = [NSMutableArray new];
    NSMutableArray* members = [NSMutableArray new];
    for (PMClubMember* m in clubInfo.memberList) {
        LTUIClubMember* member = [[LTUIClubMember alloc] initWithServerModel:m];
        if (member.type == LTMemberTypeManager) {
            [managers addObject:member];
        } else
        {
            [members addObject:member];
        }
    }
    memberControl.managers = managers;
    memberControl.members = members;
    
    _membersViewController.membersControl = memberControl;
    _clubInfoViewController.introText = clubInfo.introText;
    
    self.title = clubInfo.name;
}
- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _swipViewController.view.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
