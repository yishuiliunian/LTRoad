//
//  LTCarMeetFeedDataController.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetFeedDataController.h"
#import "LTCarMeetFeedCell.h"
#import "LTGlobals.h"
@implementation LTCarMeetFeedDataController
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.objectMapCell = @{LTCellMapPairWithClass(LTUICarMeetFeed, LTCarMeetFeedCell)};
    return self;
}


- (void) reloadAllData
{
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0 ; i < 10; i++) {
        LTUICarMeetFeed* feed = [LTUICarMeetFeed new];
        feed.carTitle = @"南山车友会";
        feed.postDate = @"12/2";
        feed.detail = @"我们从这里出发一直向西";
        feed.feedImageURL = [NSURL URLWithString:@"http://preview.quanjing.com/danita_rm008/us02-rbe0002.jpg"];
        if (i %2 ==0 ) {
            feed.feedImageURL = nil;
        }
        feed.commentCount = 2;
        feed.ownerName = @"愤怒的小妞";
        feed.postDate = @"2021/1/1";
        [array addObject:feed];
    }
    _array = array;
    [self.tableView reloadData];
}
- (MSRequest<LTPageRequestProtocol>*) syncDataReqeust{
    
    return nil;
}
- (void) decorateCell:(UITableViewCell *)cell withObject:(id)object
{
    LTCarMeetFeedCell* feedCell = (LTCarMeetFeedCell*)cell;
    feedCell.carMeetFeed = object;
}
@end
