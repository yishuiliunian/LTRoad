//
//  LTUIDiscoverItem.h
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMCategoryInfo.h"
@interface LTUIDiscoverItem : NSObject
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSURL* backgroundURL;
@property (nonatomic, strong) NSString* categoryID;
@property (nonatomic, strong) NSString* contentCount;
@property (nonatomic, strong, readonly) PMCategoryInfo* category;
- (instancetype) initWithCategory:(PMCategoryInfo*)category;
@end
