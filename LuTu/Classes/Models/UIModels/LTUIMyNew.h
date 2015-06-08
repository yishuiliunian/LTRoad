//
//  LTUIMyNew.h
//  LuTu
//
//  Created by stonedong on 15/6/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMUserNewsInfo.h"
@interface LTUIMyNew : NSObject
@property (nonatomic, strong) NSString* dynamicId;
@property (nonatomic, strong) NSString* timeText;
@property (nonatomic, strong) NSString* content;
- (instancetype) initWithPMNews:(PMUserNewsInfo*)info;
@end
