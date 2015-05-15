//
//  LTSearchReq.m
//  LuTu
//
//  Created by stonedong on 15/5/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTSearchReq.h"
#import "LTUserDataManager.h"
@implementation LTSearchReq
- (NSString*) method
{
    return @"/search";
}
- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    [self addParamter:self.keyword forKey:@"keyword"];
    [self addParamter:LTShareSettings().currentCity forKey:@"city"];
    return YES;
}

- (void) onSuccess:(id)retObject
{
    
}
@end
