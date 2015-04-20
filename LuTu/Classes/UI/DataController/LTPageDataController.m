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
    _pageIndex = 1;
    return self;
}

- (void) setObjectMapCell:(NSDictionary *)objectMapCell
{
    if (_objectMapCell != objectMapCell) {
        _objectMapCell = objectMapCell;
        [self registerTableClass];
    }
}

- (void) registerTableClass
{
    for (NSString* key in _objectMapCell.allKeys) {
        [_tableView registerClass:_objectMapCell[key] forCellReuseIdentifier:key];
    }
}
- (void) setTableView:(UITableView *)tableView
{
    if (_tableView != tableView) {
        _tableView = tableView;
        _tableView.dataSource = self;
        [self registerTableClass];
    }
}
- (void) forwardInvocation:(NSInvocation *)anInvocation
{
    if ([_array respondsToSelector:anInvocation.selector] ){
        [anInvocation invokeWithTarget:_array];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

- (void) reloadAllData
{
    NSParameterAssert(self.objectMapCell);
    NSParameterAssert(self.tableView);
}

- (void) getNetPageData
{
    
}

- (id) objectAtIndex:(NSInteger)index
{
    return _array[index];
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id line = _array[indexPath.row];
    NSString* const kCellIdentifier = LTCellIdentifierFromClass([line class]);
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    [self decorateCell:cell withObject:line];
    return cell;
}
- (void) decorateCell:(UITableViewCell*)cell withObject:(id)object
{
    
}

@end
