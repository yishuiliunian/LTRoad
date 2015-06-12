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
- (instancetype) initWithPMComment:(PMThreadPostInfo *)comment
{
    self = [super init];
    if (!self) {
        return self;
    }

    _nickName = comment.creatorName;
    _postDate = TIME_TO_STR(comment.createTime);
    _avatarURL = STR_TO_URL(comment.creatorAvatarUrl);
    _contentText =  comment.content;
    _postId = comment;
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
