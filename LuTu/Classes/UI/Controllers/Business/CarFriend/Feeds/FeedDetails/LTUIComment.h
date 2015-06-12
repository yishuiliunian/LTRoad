//
//  LTUIComment.h
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMThreadPostInfo.h"
@interface LTUIComment : NSObject
@property (nonatomic, strong) NSString* postId;
@property (nonatomic, strong) NSString* nickName;
@property (nonatomic, strong) NSString* roleName;
@property (nonatomic, strong) NSString* postDate;
@property (nonatomic, strong) NSString* contentText;
@property (nonatomic, strong) NSURL* avatarURL;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGRect topRect;
@property (nonatomic, assign) CGRect bottomRect;

- (instancetype) initWithPMComment:(PMThreadPostInfo*)comment;
@end
