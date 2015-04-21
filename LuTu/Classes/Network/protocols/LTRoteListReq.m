//
//  LTRoteListReq.m
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRoteListReq.h"
#import "LTRecommendLine.h"
#import "PMRecommondLine.h"
@implementation LTRoteListReq

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _pageSize = LTPageSizeDefault;
    _pageId = 1;
    return self;
}
- (NSString*) method
{
    return @"/route/list";
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    [self addParamter:self.city forKey:@"city"];
    [self addParamter:self.keyword forKey:@"keyword"];
    [self addParamter:self.category forKey:@"category"];
    [self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
    [self addParamterNumber:@(self.pageId) forKey:@"pageId"];
    return YES;
}

- (void) onSuccess:(id)retObject
{
    NSArray* routeDics = [retObject objectForKey:@"routes"];
    NSError* error = nil;

    NSArray* protocolModels = [MTLJSONAdapter modelsOfClass:[PMRecommondLine class] fromJSONArray:routeDics error:&error];

    NSMutableArray* array = [NSMutableArray new];
    for (PMRecommondLine* line in protocolModels) {
        LTRecommendLine* rLine = [[LTRecommendLine alloc] initWithNetworkModel:line];
        [array addObject:rLine];
    }
#ifdef DEBUG
    for (int i = 0; i < 100; i++) {
        [array addObject:array.firstObject];
    }
#endif
    [self doUIOnSuccced:array];
}
@end
