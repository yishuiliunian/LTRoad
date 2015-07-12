//
//  LTInputTableViewCell.h
//  LuTu
//
//  Created by stonedong on 15/7/12.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
@interface LTInputTableViewCell : UITableViewCell
DEFINE_PROPERTY_STRONG(UITextField*, textField);
DEFINE_PROPERTY_STRONG(UILabel*, titleLable);
@end
