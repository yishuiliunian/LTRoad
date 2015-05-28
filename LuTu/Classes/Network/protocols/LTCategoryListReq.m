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
    NSArray* categoriesJSONData = [retObject objectForKey:@"list"];
    NSArray* categories = [MTLJSONAdapter modelsOfClass:[PMCategory class] fromJSONArray:categoriesJSONData error:nil];
    
    NSMutableArray* outArray = [NSMutableArray new];
    for (PMCategory* c in categories) {
        LTUIDiscoverItem* item = [[LTUIDiscoverItem alloc] initWithCategory:c];
        [outArray addObject:item];
    }
    [self doUIOnSuccced:[outArray copy]];
}
@end


