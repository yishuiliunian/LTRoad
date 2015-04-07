//
//  LTCheckServiceReq.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCheckServiceReq.h"

@implementation LTCheckServiceReq
- (NSString*) method
{
    return @"/server/status/check";
}

- (void) onSuccess:(id)retObject
{
    [self doUIOnSuccced:retObject];
}
@end
