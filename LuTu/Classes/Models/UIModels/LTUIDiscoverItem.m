//
//  LTUIDiscoverItem.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUIDiscoverItem.h"
#import "LTGlobals.h"
@implementation LTUIDiscoverItem

- (instancetype) initWithCategory:(PMCategoryInfo *)category
{
    self = [super init];
    if (!self) {
        return self;
    }
    _category = category;
    _title = category.name;
    _backgroundURL = [NSURL URLWithString:category.introImageUrl];
    _categoryID =ENSURE_STR( category.categoryId);
    _contentCount = [@(category.routeCount) stringValue];
    return self;
}
@end
