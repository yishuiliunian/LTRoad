//
//  LTBadgeItem.h
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LTCreateBadgeItemWithText(text)  [[LTBadgeItem alloc] initWithText:text]

@interface LTBadgeItem : NSObject
@property (nonatomic, strong, readonly) NSString* text;
@property (nonatomic, assign, readonly) double width;
@property (nonatomic, assign, readonly) double height;
@property (nonatomic, assign) double xOffset;
@property (nonatomic, assign) double yOffset;
- (instancetype) initWithText:(NSString*)text;
@end
