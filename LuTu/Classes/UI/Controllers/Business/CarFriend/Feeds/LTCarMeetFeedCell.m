//
//  LTCarMeetFeedCell.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetFeedCell.h"
#import "LKHaneke.h"
#import <DZGeometryTools.h>
#import <DZImageCache.h>
#import "LTGlobals.h"
#import "LTLinePointView.h"
@interface LTCarMeetFeedCell ()
@property (nonatomic, strong) UIImageView* pointView;
@end

@implementation LTCarMeetFeedCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    
    INIT_SUBVIEW_UIImageView(self.contentView, _feedImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _carMeetTitleLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _feedDetailLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _ownerNameLabel);
    INIT_SUBVIEW(self.contentView, UIImageView, _pointView);
    INIT_SUBVIEW(self.contentView, LTLikeButton, _commentButton);
    //
    _feedImageView.hnk_cacheFormat = LTHanekeCacheFormatCarMeet();
    _feedImageView.layer.masksToBounds = YES;
    _feedDetailLabel.numberOfLines = 0;
    //
    [_commentButton setImage:DZCachedImageByName(@"post_comment") forState:UIControlStateNormal];
    [_commentButton setTitleColor:LTColorDetailGray() forState:UIControlStateNormal];
    //
    _carMeetTitleLabel.font = LTFontSubTitle();
    _feedDetailLabel.font = LTFontContentText();
    _ownerNameLabel.font = LTFontSubTitle();
    //
    _carMeetTitleLabel.textColor = LTColorDetailGray();
    _feedDetailLabel.textColor = LTColorGray();
    _ownerNameLabel.textColor = LTColorGray();
    //
    _pointView.backgroundColor = LTColorDetailGray();
    return self;
}

- (void) setCarMeetFeed:(LTUICarMeetFeed *)carMeetFeed
{
    if (carMeetFeed != _carMeetFeed) {
        _carMeetFeed = carMeetFeed;
        [self decorateCell];
    }
}

- (void) decorateCell
{
    [_feedImageView loadLittleImageURL:_carMeetFeed.feedImageURL];
    _carMeetTitleLabel.text = _carMeetFeed.carTitle;
    _feedDetailLabel.text = _carMeetFeed.detail;
    _ownerNameLabel.text =[NSString stringWithFormat:@"%@ %@",_carMeetFeed.ownerName, _carMeetFeed.postDate];
    [_commentButton setTitle:[@(_carMeetFeed.commentCount) stringValue] forState:UIControlStateNormal];
    [self setNeedsLayout];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    static CGFloat xSpace = 10;
    static CGFloat ySpace = 10;
    
#define hasImage (_carMeetFeed.feedImageURL)
    
    CGRect contentRect = CGRectMake(xSpace, ySpace, CGRectGetWidth(self.bounds) - xSpace * 2, CGRectGetHeight(self.bounds) - ySpace * 2);
    CGFloat imageWidth = 0;
    if (hasImage) {
        imageWidth = 80;
    }
    CGRect textContentRect;
    CGRect imageRect;
    CGRectDivide(contentRect, &imageRect, &textContentRect, imageWidth, CGRectMaxXEdge);
    _feedImageView.frame = imageRect;
    
    if (hasImage) {
        textContentRect.size.width -= xSpace;
    }
    
    CGFloat clubTitleHeight = 15;
    CGFloat nickTimeHeight = 15;
    
    CGRect clubTitleRecct;
    CGRect restRect;
    CGRectDivide(textContentRect, &clubTitleRecct, &restRect, clubTitleHeight, CGRectMinYEdge);
    _carMeetTitleLabel.frame = clubTitleRecct;
    
    CGRect detailRect;
    CGRect bottomRect;
    
    CGRectDivide(restRect, &bottomRect, &detailRect, nickTimeHeight, CGRectMaxYEdge);
    
    detailRect = CGRectCenterSubSize(detailRect, CGSizeMake(0, 10));
    _feedDetailLabel.frame = detailRect;
    
    CGFloat commentWidth = 60;
    
    CGRect nickRect;
    CGRect commentBtnRect;
    
    CGRectDivide(bottomRect, &commentBtnRect, &nickRect, commentWidth, CGRectMaxXEdge);
    commentBtnRect.size.width -=xSpace;

    CGRect pointRect;
    CGRectDivide(nickRect, &pointRect, &nickRect, 10, CGRectMinXEdge);
    _ownerNameLabel.frame = nickRect;
    _commentButton.frame = commentBtnRect;
    
    pointRect = CGRectOfCenterForContainsSize(pointRect, CGSizeMake(CGRectGetWidth(pointRect), CGRectGetWidth(pointRect)));
    _pointView.frame = pointRect;

    _pointView.layer.cornerRadius = CGRectGetWidth(_pointView.frame)/2;
}
@end
