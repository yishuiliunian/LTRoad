//
//  MSAddAvarterCell.m
//  MoShang
//
//  Created by stonedong on 15/3/3.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "MSAddAvarterCell.h"
#import <DZProgramDefines.h>
#import "LTGlobals.h"
@implementation MSAddAvarterCell
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIImageView(self.contentView, _addIndictorImageView);
    _addIndictorImageView.image = DZCachedImageByName(@"icon_add");
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _addIndictorImageView.frame = self.contentView.bounds;
}
@end
