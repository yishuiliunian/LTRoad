//
//  LTUIClubMember.h
//  LuTu
//
//  Created by stonedong on 15/6/3.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMClubMember.h"

typedef enum {
    LTMemberTypeUnkow = 2,
    LTMemberTypeNormal = 1,
    LTMemberTypeManager = 0,
}LTMemberType;

@interface LTUIClubMember : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* vihicleModel;
@property (nonatomic, strong) NSURL* avatarURL;
@property (nonatomic, assign) LTMemberType type;
- (instancetype) initWithServerModel:(PMClubMember*)member;
@end
