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

- (void) getNetPageData
{
    MSRequest<LTPageRequestProtocol> * pageRequest = [self syncDataReqeust];
    pageRequest.pageNo = ++_pageIndex;
    MSPerformRequestWithDelegateSelf(pageRequest);
}


- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
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

- (void) reloadUIAllUIData
{
    
}

- (void) insertUIDataAtIndexs:(NSArray*)indexPaths
{
    
}
- (void) handleNextPageData:(NSArray*)data
{
    
}


- (void) decorateCell:(UITableViewCell*)cell withObject:(id)object
{
    
}

@end
