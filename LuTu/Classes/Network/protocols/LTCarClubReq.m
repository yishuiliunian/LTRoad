//
//  LTCarClubReq.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarClubReq.h"
#import "LTLocationManager.h"
#import "LTUserDataManager.h"
@implementation LTCarClubReq
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _pageId = 1;
    _pageSize = 100;
    return self;
}
- (NSString*) method
{
    return @"/car_club/search";
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
    [self addParamterNumber:@(self.pageId) forKey:@"pageId"];
    [self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
    [self addParamter:self.keyword forKey:@"keyword"];
    [self addParamter:LTShareSettings().currentCity forKey:@"city"];
#ifdef DEBUG
    if (!self.keyword) {
        [self addParamter:@"" forKey:@"keyword"];
    }
#endif
    return YES;
}


- (void) onError:(NSError *)error
{
    [super onError:error];
}
- (void) onSuccess:(id)retObject
{
    
}
@end
