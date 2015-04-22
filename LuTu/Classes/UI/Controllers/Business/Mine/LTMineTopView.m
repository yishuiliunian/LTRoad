//
//  LTMineTopView.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMineTopView.h"
#import <DZGeometryTools.h>
#import "LKHaneke.h"
#import "UIButton+decorate.h"

@interface LTMineTopView ()
{
    CGFloat topOffset ;
    CGFloat xContentInsetH ;
    CGFloat itemSpaceX;
    int itemCount;
    CGFloat itemSpaceY;
    CGFloat nickNameHeight;
}
@end
@implementation LTMineTopView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_backgroundImageView);
    INIT_SELF_SUBVIEW_UIImageView(_avatarImageView);
    INIT_SELF_SUBVIEW(LTBottomLabelButton, _messageButton);
    INIT_SELF_SUBVIEW(LTBottomLabelButton, _settingButton);
    INIT_SELF_SUBVIEW(LTBackButton, _favarateButton);
    INIT_SELF_SUBVIEW(LTBackButton, _feedButton);
    INIT_SELF_SUBVIEW(LTBackButton, _carFriendButton);
    INIT_SELF_SUBVIEW_UILabel(_nickNameLabel);
    _avatarImageView.userInteractionEnabled = YES;
    //
     topOffset = 40;
     xContentInsetH = 15;
     itemSpaceX = 10;
     itemCount = 3;
    itemSpaceY = 10;
    nickNameHeight = 20;
    //
    [self decorateAllControls];
    return self;
}

- (void) decorateAllControls
{
#ifdef DEBUG
    _avatarImageView.backgroundColor = [UIColor redColor];
#endif
    _avatarImageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    _avatarImageView.layer.masksToBounds = YES;
    [_messageButton decorateWithImage:@"btn_msg_normal" highLightImage:@"btn_msg_click" title:@"消息"];
    [_settingButton decorateWithImage:@"btn_msg_normal" highLightImage:@"btn_msg_click" title:@"设置"];
    [_favarateButton decorateWithImage:@"btn_msg_normal" highLightImage:@"btn_msg_click" title:@"我的收藏"];
    [_feedButton decorateWithImage:@"btn_msg_normal" highLightImage:@"btn_msg_click" title:@"我的话题"];
    [_carFriendButton decorateWithImage:@"btn_msg_normal" highLightImage:@"btn_msg_click" title:@"我的车友会"];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _backgroundImageView.frame = self.bounds;
    CGFloat cotentWidth = CGRectGetWidth(self.bounds) - xContentInsetH*2;
    CGFloat itemWidth = (CGRectGetWidth(self.bounds) - xContentInsetH * 2 - itemSpaceX* (itemCount - 1)) /itemCount;
    CGSize avatarSize = CGSizeMake(itemWidth, itemWidth);
    _avatarImageView.frame = CGRectMake(CGRectWidthOffsetCenter(self.bounds,avatarSize.width), topOffset , avatarSize.width, avatarSize.height);
    
    _avatarImageView.layer.cornerRadius = itemWidth/2;
    CGSize topItemButtonSize = CGSizeMake(40, 80);
    _messageButton.frame = CGRectMake(CGRectGetMinX(_avatarImageView.frame) - itemSpaceX - topItemButtonSize.width,
                                      CGRectGetCenter(_avatarImageView.frame).y - topItemButtonSize.height/2,
                                      topItemButtonSize.width,
                                      topItemButtonSize.height);
    _settingButton.frame = CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + itemSpaceX, CGRectGetMinY(_messageButton.frame), topItemButtonSize.width, topItemButtonSize.height);
    //
    _nickNameLabel.frame = CGRectMake(xContentInsetH, CGRectGetMaxY(_avatarImageView.frame) + itemSpaceY, cotentWidth, nickNameHeight);
    //
    
    _favarateButton.frame = CGRectMake(xContentInsetH, CGRectGetMaxY(_nickNameLabel.frame), itemWidth, itemWidth);
    _feedButton.frame = CGRectOffset(_favarateButton.frame, itemWidth + itemSpaceX, 0);
    _carFriendButton.frame = CGRectOffset(_feedButton.frame, itemWidth + itemSpaceX, 0);
    
    
}

- (CGFloat) minHeight
{
    CGRect rect = [UIScreen mainScreen].bounds;
    CGFloat itemWidth = (CGRectGetWidth(rect) - xContentInsetH * 2 - itemSpaceX* (itemCount - 1)) /itemCount;
    return topOffset + itemWidth + itemSpaceY + nickNameHeight + itemSpaceY + itemWidth;
}

@end
