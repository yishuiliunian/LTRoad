//
//  LTFeedHeadView.m
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTFeedHeadView.h"
#import <DZGeometryTools.h>
#import "DZAdjustHeightTools.h"
#import "LTGlobals.h"

@interface LTFeedHeadView ()
{
    CGFloat _xSpace;
    CGFloat _ySpace;
    CGFloat _bottomHeight;
}

@end

@implementation LTFeedHeadView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW(LTGrowLabel, _titleLabel);
    INIT_SELF_SUBVIEW_UILabel(_clubNickLabel);
    INIT_SELF_SUBVIEW(LTLikeButton, _lookedCountButton);
    INIT_SELF_SUBVIEW(LTLikeButton, _commentButton);
    //
    //
    _ySpace = 10;
    _xSpace = 10;
    _bottomHeight = 15;
    //
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.numberOfLines = 0;
    _clubNickLabel.textAlignment = NSTextAlignmentRight;
    _clubNickLabel.textColor = LTColorDetailGray();
    [_lookedCountButton setTitleColor:LTColorDetailGray() forState:UIControlStateNormal];
    [_commentButton setTitleColor:LTColorDetailGray() forState:UIControlStateNormal];
    [_lookedCountButton setImage:DZCachedImageByName(@"post_comment") forState:UIControlStateNormal];
    [_commentButton setImage:DZCachedImageByName(@"post_comment") forState:UIControlStateNormal];
    return self;
}
- (void) handleAdjustFrame
{
    self.adjustHeight =  _titleLabel.adjustHeight + _ySpace*3 + _xSpace + _bottomHeight;
}
- (BOOL) hintAdjustSupreView
{
    return YES;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = CGRectCenterSubSize(self.bounds, CGSizeMake(_xSpace*2, _ySpace*2));
    
    CGRect bottomRect;
    CGRect titleRect;
    CGRectDivide(contentRect, &bottomRect, &titleRect, _bottomHeight, CGRectMaxYEdge);
    titleRect.size.height -= _ySpace;
    
    _titleLabel.frame = titleRect;
    
    CGRect lookRect;
    CGRect commentRect;
    CGRect clubRect;
    
    CGFloat btnWidth = 50;
    CGRectDivide(bottomRect, &lookRect, &commentRect, btnWidth , CGRectMinXEdge);
    
    commentRect.origin.x += _xSpace;
    commentRect.size.width -= _xSpace;
    
    CGRectDivide(commentRect, &commentRect, &clubRect, btnWidth, CGRectMinXEdge);
    
    clubRect.size.width -= _xSpace;
    clubRect.origin.x += _xSpace;
    
    _commentButton.frame = commentRect;
    _lookedCountButton.frame = lookRect;
    _clubNickLabel.frame = clubRect;
    
}

@end


