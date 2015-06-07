//
//  LTSearchDataController.h
//  LuTu
//
//  Created by stonedong on 15/5/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LTUIMyCarClubInfo.h"
#import "LTUICarMeetFeed.h"

@interface LTSearchDataController : NSObject
@property (nonatomic, weak) UITableView* tableView;
@property (nonatomic, assign, readonly) NSUInteger sectionCount;
- (NSUInteger) numberOfObjectAtSection:(NSInteger)section;
- (void) searchKeyword:(NSString*)keyword;
- (id) objectAtIndexPath:(NSIndexPath*)indexPath;

- (NSString*) headerViewIdentifierForSection:(NSInteger)section;
@end
