//
//  LTSearchDataController.h
//  LuTu
//
//  Created by stonedong on 15/5/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LTSearchDataController : NSObject
@property (nonatomic, weak) UITableView* tableView;
@property (nonatomic, assign, readonly) NSUInteger sectionCount;
- (NSUInteger) numberOfObjectAtSection:(NSInteger)section;
- (void) searchKeyword:(NSString*)keyword;
@end
