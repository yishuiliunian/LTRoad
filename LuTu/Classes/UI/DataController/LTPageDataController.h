//
//  LTPageDataController.h
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LTPageDataController : NSObject <NSFastEnumeration>
{
    NSArray* _array;
    NSInteger _pageIndex;
    NSInteger _pageSize;
}
@property (nonatomic, strong, readonly) NSArray* array;
@property (nonatomic, assign, readonly) NSInteger pageIndex;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSDictionary* objectMapCell;
- (void) reloadAllData;
- (void) getNetPageData;
- (id) objectAtIndex:(NSInteger)index;

//
- (void) decorateCell:(UITableViewCell*)cell withObject:(id)object;
@end
