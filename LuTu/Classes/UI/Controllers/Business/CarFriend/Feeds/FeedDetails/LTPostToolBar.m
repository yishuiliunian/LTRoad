//
//  LTPostToolBar.m
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTPostToolBar.h"
#import <DZProgramDefines.h>
#import "LTGlobals.h"
@interface LTPostToolBar ()
{
    UIButton* _leftBtn;
    UIButton* _rightBtn;
    UILabel* _indexLabel;
}
@end
@implementation LTPostToolBar
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIButton(self, _leftBtn);
    INIT_SUBVIEW_UIButton(self, _rightBtn);
    INIT_SELF_SUBVIEW_UILabel(_indexLabel);
    _pageCount = 1;
    _currentPageIndex = 1;
    //
    [_leftBtn setTitle:@"上一页" forState:UIControlStateNormal];
    [_rightBtn setTitle:@"下一页" forState:UIControlStateNormal];
    [_leftBtn setTitleColor:LTColorDetailGray() forState:UIControlStateNormal];
    [_rightBtn setTitleColor:LTColorDetailGray() forState:UIControlStateNormal];
    //
    
    [_leftBtn addTarget:self action:@selector(handleGoToBefore:) forControlEvents:UIControlEventTouchUpInside];
    [_leftBtn addTarget:self action:@selector(handleGoToNext:) forControlEvents:UIControlEventTouchUpInside];
    _indexLabel.layer.cornerRadius = 5;
    _indexLabel.layer.borderWidth = 1;
    _indexLabel.layer.borderColor = LTColorDetailGray().CGColor;
    _indexLabel.textColor = LTColorDetailGray();
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    [self showIndex];
    return self;
}
- (void) setPageCount:(int)pageCount
{
    _pageCount = pageCount;
    [self showIndex];
    [self checkButtonEnable];
}
- (void) setCurrentPageIndex:(int)currentPageIndex
{
    _currentPageIndex = currentPageIndex;
    [self showIndex];
    [self checkButtonEnable];
}


- (void) handleGoToNext:(UIButton*)btn
{
    if (_currentPageIndex >= _pageCount) {
        return;
    }
    self.currentPageIndex ++;
    if ([self.delegate respondsToSelector:@selector(postToolBar:didMoveToIndex:)]) {
        [self.delegate postToolBar:self didMoveToIndex:self.currentPageIndex];
    }
}

- (void) handleGoToBefore:(UIButton*)btn
{
    if (_currentPageIndex <= 1) {
        return;
    }
    self.currentPageIndex --;
    if ([self.delegate respondsToSelector:@selector(postToolBar:didMoveToIndex:)]) {
        [self.delegate postToolBar:self didMoveToIndex:self.currentPageIndex];
    }
   }

- (void) checkButtonEnable
{
    _leftBtn.enabled = self.currentPageIndex > 1;
    _rightBtn.enabled = self.currentPageIndex < _pageCount;
}
- (void) showIndex
{
    _indexLabel.text = [NSString stringWithFormat:@"%d/%d", _currentPageIndex, _pageCount];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = CGRectCenterSubSize(self.bounds, CGSizeMake(40, 10));
    CGFloat width = CGRectGetWidth(contentRect)/3;
    CGRect leftRect;
    CGRect labelRect;
    CGRect rightRect;
    
    CGRectDivide(contentRect, &leftRect, &labelRect, width, CGRectMinXEdge);
    CGRectDivide(labelRect, &labelRect, &rightRect, width, CGRectMinXEdge);
    
    CGRect (^ShrinkRect)(CGRect rect ) = ^(CGRect rect) {
        return CGRectCenterSubSize(rect, CGSizeMake(10, 0));
    };
    
    _leftBtn.frame = ShrinkRect(leftRect);
    _indexLabel.frame = ShrinkRect(labelRect);
    _rightBtn.frame = ShrinkRect(rightRect);
}

@end
