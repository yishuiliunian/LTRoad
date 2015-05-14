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
#import "LKHaneke.h"
#import "LTAppearenceTools.h"
#import <FXBlurView.h>

@interface LTMineTopView ()
{
    CGFloat topOffset ;
    CGFloat xContentInsetH ;
    CGFloat itemSpaceX;
    int itemCount;
    CGFloat itemSpaceY;
    CGFloat nickNameHeight;
    CGFloat topItemXOffset;
}
@end

static NSString* const kObserverImage = @"image";
@implementation LTMineTopView

- (void) dealloc
{
    [_avatarImageView removeObserver:self forKeyPath:kObserverImage];
}
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
    topItemXOffset = 30;
    //
    [self decorateAllControls];
    
    [_avatarImageView addObserver:self forKeyPath:kObserverImage options:NSKeyValueObservingOptionNew context:nil];
    
    return self;
}
- (void) handleAvatarGetNewImage:(UIImage*) image
{
    UIImage* blurImage = [image blurredImageWithRadius:2 iterations:9 tintColor:nil];
    _backgroundImageView.image = blurImage;
    _backgroundImageView.alpha = 0.4;
}
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _avatarImageView) {
        if ([keyPath isEqualToString:kObserverImage]) {
            UIImage* image = [change objectForKey:NSKeyValueChangeNewKey];
            [self handleAvatarGetNewImage:image];
        }
    }
}
- (void) decorateAllControls
{
#ifdef DEBUG
    _avatarImageView.backgroundColor = [UIColor redColor];
#endif
    _avatarImageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    _avatarImageView.layer.masksToBounds = YES;
    [_messageButton decorateWithImage:@"my_inforn" highLightImage:@"my_inforn_click" title:@"消息"];
    [_settingButton decorateWithImage:@"my_setting" highLightImage:@"my_setting_click" title:@"设置"];
    [_favarateButton decorateWithImage:@"my_fav" highLightImage:@"my_fav_click" title:@"我的收藏"];
    [_feedButton decorateWithImage:@"my_posts" highLightImage:@"my_posts_click" title:@"我的话题"];
    [_carFriendButton decorateWithImage:@"my_group" highLightImage:@"my_group_click" title:@"我的车友会"];
    //
    ColorLabelWithWhite(_nickNameLabel);
    _nickNameLabel.textAlignment = NSTextAlignmentCenter;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect backrect = self.bounds;
    backrect.origin.y -= 64;
    backrect.size.height += 64;
    _backgroundImageView.frame = backrect;
    CGFloat cotentWidth = CGRectGetWidth(self.bounds) - xContentInsetH*2;
    CGFloat itemWidth = (CGRectGetWidth(self.bounds) - xContentInsetH * 2 - itemSpaceX* (itemCount - 1)) /itemCount;
    CGSize avatarSize = CGSizeMake(itemWidth, itemWidth);
    _avatarImageView.frame = CGRectMake(CGRectWidthOffsetCenter(self.bounds,avatarSize.width), topOffset , avatarSize.width, avatarSize.height);
    
    _avatarImageView.layer.cornerRadius = itemWidth/2;
    CGSize topItemButtonSize = CGSizeMake(40, 80);
    _messageButton.frame = CGRectMake(CGRectGetMinX(_avatarImageView.frame) - topItemXOffset - topItemButtonSize.width,
                                      CGRectGetCenter(_avatarImageView.frame).y - topItemButtonSize.height/2,
                                      topItemButtonSize.width,
                                      topItemButtonSize.height);
    _settingButton.frame = CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + topItemXOffset, CGRectGetMinY(_messageButton.frame), topItemButtonSize.width, topItemButtonSize.height);
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
