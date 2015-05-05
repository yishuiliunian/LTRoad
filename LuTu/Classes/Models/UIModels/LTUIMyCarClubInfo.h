//
//  LTUIMyCarClubInfo.h
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import "PMUserCarClub.h"
@interface LTUIMyCarClubInfo : MTLModel
@property (nonatomic, assign) int club_id;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* detailInfo;
@property (nonatomic, strong) NSURL* avatarImageUrl;
- (instancetype) initWithPMUserCarClubInfo:(PMUserCarClub*)info;
@end
