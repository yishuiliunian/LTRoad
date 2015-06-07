//
//  LTMyThreadDataController.m
//  LuTu
//
//  Created by stonedong on 15/6/7.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyThreadDataController.h"
#import "LTUserThreadListReq.h"
#import "LTAccountManager.h"
@implementation LTMyThreadDataController
- (MSRequest<LTPageRequestProtocol>*) syncDataReqeust{
    
    LTUserThreadListReq* threadListReq = [LTUserThreadListReq new];
    threadListReq.userId = LTCurrentAccount.accountID;
    return threadListReq;
}
@end