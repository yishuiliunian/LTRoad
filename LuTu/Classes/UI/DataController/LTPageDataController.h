//
//  LTPageDataController.h
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MSRequest.h"
#import "LTPageRequestProtocol.h"
#import <MJRefresh.h>
@interface LTPageDataController : NSObject <NSFastEnumeration, MSRequestUIDelegate>
{
    NSArray* _array;
    int _pageIndex;
    int _pageSize;
}
@property (nonatomic, strong, readonly) NSArray* array;
@property (nonatomic, assign, readonly) int pageIndex;
@property (nonatomic, assign) int pageSize;
@property (readonly) NSUInteger count;
- (id)objectAtIndex:(NSUInteger)index;
- (void) reloadAllData;
- (void) getNextPageData;

//
- (MSRequest<LTPageRequestProtocol>*) syncDataReqeust;
- (void) reloadUIAllUIData;
- (void) insertUIDataAtIndexs:(NSArray*)indexPaths;
//
- (void) handleOnError:(NSError*)error;
- (void) handleReloadData:(NSArray*)data;
- (void) handleNextPageData:(NSArray*)data;
//
//array 的常用方法
- (NSArray *)arrayByAddingObject:(id)anObject;
- (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray;
- (NSString *)componentsJoinedByString:(NSString *)separator;
- (BOOL)containsObject:(id)anObject;
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (id)firstObjectCommonWithArray:(NSArray *)otherArray;
- (void)getObjects:(id __unsafe_unretained [])objects range:(NSRange)range;
- (NSUInteger)indexOfObject:(id)anObject;
- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range;
- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject;
- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range;
- (BOOL)isEqualToArray:(NSArray *)otherArray;
- (NSEnumerator *)objectEnumerator;
- (NSEnumerator *)reverseObjectEnumerator;
- (NSArray *)sortedArrayUsingFunction:(NSInteger (*)(id, id, void *))comparator context:(void *)context;
- (NSArray *)sortedArrayUsingFunction:(NSInteger (*)(id, id, void *))comparator context:(void *)context hint:(NSData *)hint;
- (NSArray *)sortedArrayUsingSelector:(SEL)comparator;
- (NSArray *)subarrayWithRange:(NSRange)range;
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
- (void)makeObjectsPerformSelector:(SEL)aSelector;
- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument;
- (NSArray *)objectsAtIndexes:(NSIndexSet *)indexes;
@end
