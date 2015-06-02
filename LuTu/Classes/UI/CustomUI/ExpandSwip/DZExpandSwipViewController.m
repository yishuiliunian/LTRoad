//
//  DZExpandSwipViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "DZExpandSwipViewController.h"
#import "DZexpandCollectionViewController.h"
#import "LTUICarMeet.h"
#import "LTCarMeetFeedViewController.h"
#import "LTCarMeetFeedDataController.h"
#import "LTUserCarClubSimpleListReq.h"
@interface DZExpandSwipViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource, DZExpandViewControllderDelegate, MSRequestUIDelegate>
@property (nonatomic, strong) DZexpandCollectionViewController* expandCollectioViewController;
@property (nonatomic, strong) UIPageViewController* pageViewController;
@property (nonatomic, strong) NSMutableDictionary* viewControllersMap;
@end

@implementation DZExpandSwipViewController

- (void) lt_addViewController:(UIViewController*)vc
{
    [vc willMoveToParentViewController:self];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = self.view.bounds;
    [vc didMoveToParentViewController:self];
}
- (void) viewDidLoad
{
    [super viewDidLoad];

    _expandCollectioViewController = [[DZexpandCollectionViewController alloc] init];
    _expandCollectioViewController.delegate = self;

    //
    [self lt_addViewController:_expandCollectioViewController];
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    [self lt_addViewController:_pageViewController];
    [self scrollToPageViewControllerAtIndex:0];
    //
    [self reloadAllCarClub];
}

- (void) reloadAllCarClub
{
    LTUserCarClubSimpleListReq* carClueReq = [LTUserCarClubSimpleListReq new];
    
    MSPerformRequestWithDelegateSelf(carClueReq);
}

#pragma mark carclub request delegate

- (void) request:(MSRequest *)request onError:(NSError *)error
{
#ifdef DEBUG
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0; i < 100; i++) {
        LTUICarMeet* carMeet = [LTUICarMeet new];
        carMeet.key = [@(i) stringValue];
        carMeet.emblemURL =  [NSURL URLWithString:@"http://preview.quanjing.com/danita_rm008/us02-rbe0002.jpg"];
        carMeet.title = @"奔驰";
        carMeet.detail = @"";
        [array addObject:carMeet];
    }
    _expandCollectioViewController.items = array;
    [self scrollToPageViewControllerAtIndex:0];
#endif
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    _expandCollectioViewController.items = object;
    [self scrollToPageViewControllerAtIndex:0];
}
#pragma mark ---
- (void) scrollToPageViewControllerAtIndex:(NSInteger)index
{
    if (index >= _expandCollectioViewController.items.count) {
        return ;
    }
    [_pageViewController setViewControllers:@[[self viewControllerAtIndex:index]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
 
}
- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _expandCollectioViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 160);
    _pageViewController.view.frame = CGRectMake(0, CGRectGetMaxY(_expandCollectioViewController.view.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetMaxY(_expandCollectioViewController.view.frame));
}
- (UIViewController*) viewControllerAtIndex:(NSInteger) index
{
    LTUICarMeet* meet = _expandCollectioViewController.items[index];
    NSString* key = meet.key;
    if (!key) {
        return nil;
    }
    LTCarMeetFeedViewController* carMeetVC = _viewControllersMap[key];
    if (!carMeetVC) {
        LTCarMeetFeedDataController* dataController = [LTCarMeetFeedDataController new];
        carMeetVC = [[LTCarMeetFeedViewController alloc] initWithDataController:dataController];
        _viewControllersMap[key] = carMeetVC;
        dataController.carMeet = meet;
    }

    return carMeetVC;
    
}
- (NSInteger) indexOfCarMeet:(LTUICarMeet*)carmeet
{
    for (int i = 0; i < _expandCollectioViewController.items.count; i++) {
        LTUICarMeet* carMeet = _expandCollectioViewController.items[i];
        if ([carMeet.key isEqualToString:carmeet.key]) {
            return i;
        }
    }
    return NSNotFound;
}
- (NSInteger) indexOfViewController:(UIViewController*)vc
{
    if (![vc isKindOfClass:[LTCarMeetFeedViewController class]]) {
        return NSNotFound;
    }
    LTUICarMeet* currentCarMeet =[ (LTCarMeetFeedDataController*)
                                  [(LTCarMeetFeedViewController*)
                                   vc dataController]
                                  carMeet];
    return [self indexOfCarMeet:currentCarMeet];
    
}
- (void) expandViewController:(DZexpandCollectionViewController *)vc didSelectItem:(LTUICarMeet *)carmett
{
    NSInteger index = [self indexOfCarMeet:carmett];
    if (index == NSNotFound) {
        return;
    }
    [self scrollToPageViewControllerAtIndex:index];
}
#pragma mark PageViewControlller
- (UIViewController*) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self indexOfViewController:viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    if (index >= (int)_expandCollectioViewController.items.count -1) {
        return nil;
    }
    
    if (index < 0) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index+1];
}

- (UIViewController*) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self indexOfViewController:viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    if (index >= (int)_expandCollectioViewController.items.count ) {
        return nil;
    }
    
    if (index < 1) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index+1];
}

- (void) pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
}

@end
