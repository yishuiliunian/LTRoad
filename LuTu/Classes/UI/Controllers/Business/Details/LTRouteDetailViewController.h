//
//  LTRouteDetailViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTRouteDetailViewController : UITableViewController
@property (nonatomic, strong) NSString* routeID;
- (instancetype) initWithRouteID:(NSString*)routeID;
@end
