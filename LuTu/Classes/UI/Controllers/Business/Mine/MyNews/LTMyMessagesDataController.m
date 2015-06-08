//
//  LTMyMessagesDataController.m
//  LuTu
//
//  Created by stonedong on 15/6/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyMessagesDataController.h"
#import "LTUserMessageListReq.h"
#import "LTGlobals.h"
@implementation LTMyMessagesDataController
- (MSRequest<LTPageRequestProtocol>*) syncDataReqeust{
    
    LTUserMessageListReq* threadListReq = [LTUserMessageListReq new];
    threadListReq.userId = LTCurrentAccount.accountID;
    return threadListReq;
}
@end
