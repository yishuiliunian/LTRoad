//
//  LTMyCarClubViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/29.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTMyCarClubViewController : UITableViewController
@property (nonatomic, strong, readonly) NSString* uid;
- (instancetype) initWithUID:(NSString*)uid;
@end
