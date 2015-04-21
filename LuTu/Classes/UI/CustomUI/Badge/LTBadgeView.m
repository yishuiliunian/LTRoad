//
//  LTBadgeView.m
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTBadgeView.h"
#import <DZProgramDefines.h>
#import "LTBadgeView_Private.h"
#import "LTFont.h"
#import "LTTagColorManager.h"
@interface LTBadgeView()
@property (nonatomic, strong, readonly) UILabel* textLabel;
@end
@implementation LTBadgeView
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UILabel(_textLabel);
    _textLabel.font = LTFontTag();
    _textLabel.adjustsFontSizeToFitWidth = YES;
    _textLabel.textAlignment = NSTextAlignmentCenter;
    self.layer.cornerRadius = 4;
    self.backgroundColor = LTColorTagDefault();
    return self;
}
- (void) setItem:(LTBadgeItem *)item
{
    if (_item != item) {
        _item = item;
        _textLabel.text = _item.text;
        self.backgroundColor = [[LTTagColorManager shareInstance] colorForKey:_item.text];
        [self setNeedsLayout];
    }
}
- (void) prepareReuse
{
//    _textLabel.text = nil;
}
- (void) layoutSubviews
{
    _textLabel.frame = CGRectMake(_item.xOffset, _item.yOffset, _item.width - (_item.xOffset) *2   , _item.height - _item.yOffset*2);
    
}
@end
