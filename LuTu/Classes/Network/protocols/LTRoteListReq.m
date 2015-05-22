//
//  LTRoteListReq.m
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRoteListReq.h"
#import "LTRecommendLine.h"
#import "PMRoteListRsp.h"
#import "PMRouteDetail.h"
@implementation LTRoteListReq
@synthesize pageId = _pageId;
@synthesize pageSize = _pageSize;
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
    [self addParamter:self.city forKey:@"cityId"];
    [self addParamter:self.keyword forKey:@"keyword"];
    [self addParamter:self.category forKey:@"categoryName"];
    [self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
    [self addParamterNumber:@(self.pageId) forKey:@"pageNo"];
    return YES;
}

- (void) onSuccess:(id)retObject
{
    NSError* error = nil;

    PMRoteListRsp* listRsp = [MTLJSONAdapter modelOfClass:[PMRoteListRsp class] fromJSONDictionary:retObject error:&error];

    NSMutableArray* array = [NSMutableArray new];
    for (PMRouteDetail* line in listRsp.list) {
        LTRecommendLine* rLine = [[LTRecommendLine alloc] initWithNetworkModel:line];
        [array addObject:rLine];
    }
#ifdef DEBUG
    if (array.count) {
        for (int i = 0; i < 100; i++) {
            [array addObject:array.firstObject];
        }
    }

#endif
    [self doUIOnSuccced:array];
}
@end
