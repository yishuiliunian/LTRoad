//
//  LTUIPoi.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUIPoi.h"
#import "LTLinePointView.h"
#import <DZGeometryTools.h>
#import "LTGlobals.h"
#import "LTLinePoiCell.h"
#import <Haneke.h>
@interface LTUIPoi ()
{
    CGRect pointRect ;
    CGRect titleRect ;
    CGRect imageRect;
    CGRect contentRect;
    CGRect timeIndicatorRect;
    CGRect timeRect;
}
@end

@implementation LTUIPoi
- (instancetype) initWithPOI:(PMPoiInfo *)poi
{
    self = [super init];
    if (!self) {
        return self;
    }
    _poiInfo= poi;
    [self calculateCellLayout];
    return self;
}

- (void) calculateCellLayout
{
    CGFloat titleLabelHeight = 20;
    CGFloat imageHeight = 200;
    CGFloat imageXOffSet = 10;
    CGFloat timeHeight = 20;
    
    CGFloat width = CGCurrentScreenSize().width;
    CGFloat contentStartX  = 20;
    CGFloat contentWidth = width - contentStartX*2;
    pointRect = CGRectMake(contentStartX, 0, titleLabelHeight, titleLabelHeight);
    titleRect = CGRectMake(CGRectGetMaxX(pointRect) +  10, 0 , contentWidth - CGRectGetMaxX(pointRect) + 10, CGRectGetHeight(pointRect));
    
    CGFloat title_image_offset = 15;
    imageRect = CGRectMake(imageXOffSet, CGRectGetMaxY(titleRect) + title_image_offset, width - imageXOffSet * 2 , imageHeight);
    
    CGFloat image_content_offset = 10;
    
    CGSize size = [_poiInfo.introText sizeWithFont:LTFontPOIDetail() constrainedToSize:CGSizeMake(contentWidth, 19999)];
    contentRect = CGRectMake(contentStartX, CGRectGetMaxY(imageRect) + image_content_offset, contentWidth, size.height);
    
    timeIndicatorRect = CGRectMake(contentStartX, CGRectGetMaxY(contentRect) + 10,  timeHeight , timeHeight);
    timeRect = CGRectMake(CGRectGetMaxX(timeIndicatorRect) - 10, CGRectGetMinY(timeIndicatorRect), contentWidth - CGRectGetMaxX(timeIndicatorRect)  - 10, timeHeight);
    
    _height = CGRectGetMaxY(timeRect) + 10 + 25;
}

- (void) loadContentForCell:(LTLinePoiCell *)cell
{
    cell.titleLabel.text = _poiInfo.name;
    [cell.introImageView  loadFeedBackgroundURL:[NSURL URLWithString:_poiInfo.introImageUrl]];
    cell.contentTextLabel.text = _poiInfo.introText;
//    cell.timeLabel.text =  _poiInfo.arrivalTime;
}

- (void) layoutContentViewForCell:(LTLinePoiCell *)cell
{
    cell.timeIndicatorImageView.frame = timeIndicatorRect;
    cell.titleLabel.frame = titleRect;
    cell.introImageView.frame = imageRect;
    cell.contentTextLabel.frame = contentRect;
    cell.pointView.frame = pointRect;
    cell.timeLabel.frame = timeRect;
    cell.contentBackgroundView.frame = CGRectMake(CGRectGetMinX(imageRect), CGRectGetMinY(imageRect), CGRectGetWidth(imageRect), CGRectGetMaxY(timeRect) - CGRectGetMinY(imageRect) + 10);
    
    CGRect lineRect = CGRectZero;
    CGFloat lineWidth = 8;
    lineRect.origin.x = cell.pointView.center.x - lineWidth/2;
    lineRect.origin.y = cell.pointView.center.y;
    lineRect.size.width = lineWidth;
    lineRect.size.height = CGRectGetHeight(cell.contentView.frame) - cell.pointView.center.y;
    cell.lineView.frame = lineRect;
}
@end
