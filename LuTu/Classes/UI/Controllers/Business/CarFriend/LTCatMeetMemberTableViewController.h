//
//  LTCatMeetMemberTableViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTCarMemberDataControl.h"
@interface LTCatMeetMemberTableViewController : UITableViewController
@property (nonatomic, strong) NSString* clubID;
@property (nonatomic, strong)     LTCarMemberDataControl* membersControl;
- (instancetype) initWithClubID:(NSString*)clubId;
@end
