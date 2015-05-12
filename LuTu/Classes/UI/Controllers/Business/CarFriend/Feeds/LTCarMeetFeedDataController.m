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
- (MSRequest<LTPageRequestProtocol>*) syncDataReqeust{
    
    return nil;
}
- (void) decorateCell:(UITableViewCell *)cell withObject:(id)object
{
    
}
@end
