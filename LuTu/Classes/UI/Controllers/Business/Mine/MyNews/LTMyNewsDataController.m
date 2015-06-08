//
//  LTMyNewsDataController.m
//  LuTu
//
//  Created by stonedong on 15/6/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyNewsDataController.h"
#import "LTUIMyNew.h"
#import "LTMyNewsTableViewCell.h"
#import "LTGlobals.h"
#import "LTUserDynamicListReq.h"
@implementation LTMyNewsDataController
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.objectMapCell = @{LTCellMapPairWithClass(LTUIMyNew , LTMyNewsTableViewCell)};
    return self;
}

- (NSString*) identifyForObject:(id)object
{
    return [(LTUIMyNew*)object dynamicId];
}

- (MSRequest<LTPageRequestProtocol>*) syncDataReqeust{
    
    LTUserDynamicListReq* threadListReq = [LTUserDynamicListReq new];
    threadListReq.userId = LTCurrentAccount.accountID;
    return threadListReq;
}
- (void) decorateCell:(UITableViewCell *)cell withObject:(id)object
{
    LTUIMyNew* n = (LTUIMyNew*)object;
    LTMyNewsTableViewCell* feedCell = (LTMyNewsTableViewCell*)cell;
    feedCell.titleLabel.text = n.timeText;
    feedCell.detailLabel.text = n.content;
}
@end
