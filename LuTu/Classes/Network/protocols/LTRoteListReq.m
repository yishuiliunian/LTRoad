//
//  LTRoteListReq.m
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRoteListReq.h"
#import "LTRecommendLine.h"
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
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0 ; i < 10; i++) {
        LTRecommendLine* line = [LTRecommendLine new];
        line.createDate =  [NSDate date];
        NSString* str = [@(i) stringValue];
        line.tagBadgeItems = @[LTCreateBadgeItemWithText(str), LTCreateBadgeItemWithText(str), LTCreateBadgeItemWithText(str)];
        line.distance = @"3.5KM";
        line.likeCount = 2;
        line.backgroudImageURL = [NSURL URLWithString:@"http://preview.quanjing.com/danita_rm008/us02-rbe0002.jpg"];
        line.title = @"一直在路上，庐山";
        line.createDateString = @"2/14";
        
        [array addObject:line];
    }
    [self doUIOnSuccced:array];
}
@end
