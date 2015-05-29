//
//  LTCategoryListReq.m
//  LuTu
//
//  Created by stonedong on 15/4/26.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCategoryListReq.h"
#import "PMCategory.h"
#import <Mantle.h>
#import "LTUIDiscoverItem.h"
#import "PMCategoryListRsp.h"
@implementation LTCategoryListReq

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _pageID = 1;
    _pageSize = 100;
    return self;
}

- (NSString*) method
{
    return @"/category/list";
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    [self addParamter:self.city forKey:@"cityId"];
    [self addParamterNumber:@(self.pageID) forKey:@"pageNo"];
    [self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
    return YES;
}

- (void) onSuccess:(id)retObject
{
    NSError* error = nil;
    PMCategoryListRsp* rsp = [MTLJSONAdapter modelOfClass:[PMCategoryListRsp class] fromJSONDictionary:retObject error:&error];
    if (error) {
        [self onError:error];
        return;
    }
    
    NSMutableArray* outArray = [NSMutableArray new];
    for (PMCategory* c in rsp.list) {
        LTUIDiscoverItem* item = [[LTUIDiscoverItem alloc] initWithCategory:c];
        [outArray addObject:item];
    }
    [self doUIOnSuccced:[outArray copy]];
}
@end


