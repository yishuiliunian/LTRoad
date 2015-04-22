//
//  LTUserInfoItem.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTUserInfoItem : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* detail;
- (instancetype) initWithName:(NSString*)name detail:(NSString*)detail;
@end
