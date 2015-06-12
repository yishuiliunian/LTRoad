//
//  LTTagColorManager.h
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LTColors.h"
@interface LTTagColorManager : NSObject
+ (LTTagColorManager*) shareInstance;
- (UIColor*) colorForKey:(NSString*)key;
- (void) registerColor:(NSString*)hexColor forKey:(NSString*)key;
@end
