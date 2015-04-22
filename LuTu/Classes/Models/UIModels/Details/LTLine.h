//
//  LTLine.h
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMLine.h"
@interface LTLine : NSObject
@property (nonatomic, strong) NSString* distance;
@property (nonatomic, strong) NSString* timeCoast;
@property (nonatomic, strong) NSString* carStyle;
@property (nonatomic, strong) UIImage* carStyleImage;
@property (nonatomic, strong) NSString* rloadCondition;
@property (nonatomic, strong) NSString* startPointName;
@property (nonatomic, strong) NSString* endPointName;

- (instancetype) initWithPMLine:(PMLine*)line;
@end
