//
//  MSRecommondRoadReq.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRecommondRoadReq.h"

@implementation LTRecommondRoadReq

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _tagID = 2;
    _pageID = 0;
    _pageSize = 8;
    return self;
}

- (NSString*) method
{
    return @"/route/search";
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    RequestAddStringParameter(self.city, @"city");
    RequestAddStringParameter(self.keyword, @"keyword");
    RequestAddNumberParameter(self.pageID, @"pageId");
    RequestAddNumberParameter(self.tagID, @"city");
    RequestAddNumberParameter(self.pageSize, @"pageSize");
    return YES;
}

- (void) onSuccess:(id)retObject
{
    
    
    
}
@end
