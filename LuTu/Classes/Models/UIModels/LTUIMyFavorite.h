//
//  LTUIMyFavorite.h
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"

@interface LTUIMyFavorite : MTLModel
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* detail;
@property (nonatomic, strong) NSURL* avatarImageURL;
@end
