//
//  LTRecommondReadDataController.m
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRecommondReadDataController.h"
#import "LTRecommendLine.h"
#import "LTGlobals.h"
#import "LTRecommondLineCell.h"
#import "LTRoteListReq.h"
#import "LTUserDataManager.h"
@interface LTRecommondReadDataController () <MSRequestUIDelegate>

@end

@implementation LTRecommondReadDataController

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.objectMapCell = @{LTCellIdentifierFromClass([LTRecommendLine class]) : [LTRecommondLineCell class] };
    return self;
}

- (void) reloadAllData
{
    [super reloadAllData];
    
    LTRoteListReq* req = [[LTRoteListReq alloc] init];
    req.city = LTShareSettings().currentCity;
    req.category = self.category;
    req.keyword = self.keyword;
    MSPerformRequestWithDelegateSelf(req);

}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    NSMutableArray* array = [[NSMutableArray alloc] initWithArray:_array];
    [array addObjectsFromArray:object];
    _array = array;
    [self.tableView reloadData];
}

- (void) decorateCell:(UITableViewCell *)cell withObject:(id)object
{
    LTRecommondLineCell* rCell = (LTRecommondLineCell*)cell;
    LTRecommendLine* line = (LTRecommendLine*)object;
    rCell.line = line;
}
@end
