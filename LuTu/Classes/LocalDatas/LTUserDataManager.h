//
//  LTUserDataManager.h
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>
@class LTSettings;
FOUNDATION_EXTERN LTSettings* LTShareSettings();
FOUNDATION_EXTERN void LTLocalizedSettings();


@interface LTSettings : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* currentCity;
@property (nonatomic, assign) BOOL isFisrstLoad;
@property (nonatomic, strong) NSString* version;
@end
@interface LTUserDataManager : NSObject
@end
