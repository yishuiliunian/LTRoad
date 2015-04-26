//
//  LTUIDiscoverItem.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUIDiscoverItem.h"

@implementation LTUIDiscoverItem

- (instancetype) initWithCategory:(PMCategory *)category
{
    self = [super init];
    if (!self) {
        return self;
    }
    _category = category;
    _title = category.name;
    _backgroundURL = [NSURL URLWithString:category.intro_image_url];
    _categoryID = category.category_id;
    return self;
}
@end
