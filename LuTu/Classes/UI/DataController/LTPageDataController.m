//
//  LTPageDataController.m
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTPageDataController.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "LTNetworkConfigure.h"
#import "LTGlobals.h"


#define LTPageFirstIndex 1
@interface LTPageDataController () <UITableViewDataSource>

@end
@implementation LTPageDataController

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _pageSize = LTPageSizeDefault;
    _pageIndex = LTPageFirstIndex;
    return self;
}
- (void) forwardInvocation:(NSInvocation *)anInvocation
{
    if ([_array respondsToSelector:anInvocation.selector] ){
        [anInvocation invokeWithTarget:_array];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

- (NSMethodSignature*) methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature* signature = [super methodSignatureForSelector:aSelector];
    if (!signature)
        signature = [_array methodSignatureForSelector:aSelector];
    return signature;
}

- (NSUInteger) count
{
    return _array.count;
}


- (MSRequest<LTPageRequestProtocol>*) syncDataReqeust
{
    return nil;
}

- (void) reloadAllData
{
    MSRequest<LTPageRequestProtocol> * pageRequest = [self syncDataReqeust];
    pageRequest.pageNo = 1;
    _pageIndex = LTPageFirstIndex;
    MSPerformRequestWithDelegateSelf(pageRequest);
}

- (void) getNextPageData
{
    MSRequest<LTPageRequestProtocol> * pageRequest = [self syncDataReqeust];
    pageRequest.pageNo = ++_pageIndex;
    MSPerformRequestWithDelegateSelf(pageRequest);
}


- (void) handleOnError:(NSError*)error
{
    
}
- (void) request:(MSRequest *)request onError:(NSError *)error
{
    [self handleOnError:error];
}


- (void) request:(MSRequest *)request onSucced:(id)object
{
    MSRequest<LTPageRequestProtocol>* req = (MSRequest<LTPageRequestProtocol>*)request;
    if (req.pageNo == LTPageFirstIndex) {
        [self handleReloadData:object];
    } else {
        [self handleNextPageData:object];
    }
}

- (void) handleReloadData:(NSArray*)data
{
    _array = data;
    [self reloadUIAllUIData];
}

- (NSString*) identifyForObject:(id)object
{
    return nil;
}

- (NSComparisonResult) compareObject:(id)object1 withObject:(id)object2
{
    return NSOrderedSame;
}
- (void) handleNextPageData:(NSArray*)data
{
    [self insertNewDatas:data];
    [self reloadUIAllUIData];
}

- (void) insertNewDatas:(NSArray*)datas
{
    NSMutableArray* copyArray = [NSMutableArray new];
    [copyArray addObjectsFromArray:_array];
    [copyArray addObjectsFromArray:datas];
    NSArray* enmeratorArray = [copyArray copy];
    NSMutableDictionary* dic = [NSMutableDictionary new];
    for (id object  in enmeratorArray) {
        NSString* key = [self identifyForObject:object];
        if (key) {
            if (dic[key]) {
                [copyArray removeObject:object];
            }
            dic[key] = @(YES);
        }
    }
    [copyArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [self compareObject:obj1 withObject:obj2];
    }];
    _array = copyArray;
}
- (void) reloadUIAllUIData
{
    
}

- (void) insertUIDataAtIndexs:(NSArray*)indexPaths
{
    
}


- (void) decorateCell:(UITableViewCell*)cell withObject:(id)object
{
    
}

@end
