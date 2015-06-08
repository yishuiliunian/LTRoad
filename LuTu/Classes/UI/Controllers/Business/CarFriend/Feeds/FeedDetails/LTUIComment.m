//
//  LTUIComment.m
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUIComment.h"
#import "LTGlobals.h"
@interface LTUIComment ()
{
    CGFloat _textHeight;
    CGFloat _avatarHeight;
}
@end
@implementation LTUIComment
- (instancetype) initWithPMComment:(PMComment *)comment
{
    self = [super init];
    if (!self) {
        return self;
    }

#ifdef DEBUG
    _nickName = @"大话红";
    _postDate = @"2033-101";
    _roleName = @"1楼";
    _avatarURL = [NSURL URLWithString:@"http://cdn.cocimg.com/bbs/attachment/upload/83/270831396235667.jpg"];
    _contentText = @"爱的说法电话费金卡回房间阿萨德会发生大富科技阿萨德和附件阿萨德和附件阿萨德会发生代发货加快递费";
#endif
    [self calculateLayout];
    return self;
}
- (void) calculateLayout
{
    _avatarHeight = 80;
    CGFloat width = LTFeedContentWidth() - _avatarHeight - LTLayoutXOffset;
    _textHeight = [self.contentText sizeWithFont:LTFontDetail() constrainedToSize:CGSizeMake(width, 10000)].height;
 
    _topRect = CGRectMake(0, 0, CGRectLoadViewFrame.size.width, _avatarHeight);
    _bottomRect = CGRectMake(LTLayoutXOffset + _avatarHeight + 10, CGRectGetMaxY(_topRect) + LTLayoutYOffset, width, _textHeight);
}
- (CGFloat) height
{
    return _textHeight + _avatarHeight + 3* LTLayoutYOffset;
}
@end
