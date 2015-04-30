//
//  LTRequestUseClubList.m
//  LuTu
//
//  Created by stonedong on 15/4/29.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRequestUseClubList.h"
#import "LTUICarMeet.h"
@implementation LTRequestUseClubList
- (NSString*)method
{
    return @"/user/car_club/simple/list";
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    [self addParamter:self.userId forKey:@"userId"];
    return YES;
}

- (void) onError:(NSError *)error
{
    [self decodeWithPMDatas:nil];
}

- (void) decodeWithPMDatas:(NSArray*)array
{
    NSMutableArray* clubs= [NSMutableArray new];
    for (int i = 1; i < 10; i++) {
        LTUICarMeet* carMeet = [LTUICarMeet new];
        carMeet.title = @"宝马车友会";
        carMeet.detail = @"100个会员";
        carMeet.emblemURL = [NSURL URLWithString:@"http://tech.uc.cn/wp-content/uploads/2014/04/docker-dev.png"];
        [clubs addObject:carMeet];
    }
    
    [self doUIOnSuccced:clubs];
}

- (void) onSuccess:(id)retObject
{
    [self decodeWithPMDatas:nil];
}
@end
