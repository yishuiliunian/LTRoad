//
//  LTMyFavoriteDataController.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyFavoriteDataController.h"
#import "LTGlobals.h"
#import "LTMyFavoriteTableViewCell.h"
#import "LTUserFavoriteRouteListReq.h"
#import "LTUIMyFavorite.h"
#import "LKHaneke.h"
@implementation LTMyFavoriteDataController
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.objectMapCell = @{LTCellMapPairWithClass( LTUIMyFavorite,LTMyFavoriteTableViewCell)};
    return self;
}

- (MSRequest<LTPageRequestProtocol>*) syncDataReqeust
{
    LTUserFavoriteRouteListReq* req = [LTUserFavoriteRouteListReq new];
    req.userId = LTCurrentAccount.accountID;
    return req;
}

- (void) decorateCell:(UITableViewCell *)cell withObject:(id)object
{
    LTMyFavoriteTableViewCell* fCell = (LTMyFavoriteTableViewCell*)cell;
    LTUIMyFavorite* fdata = (LTUIMyFavorite*)object;
    [fCell.imageView hnk_setImageFromURL:fdata.avatarImageURL];
    fCell.textLabel.text = fdata.title;
    fCell.detailTextLabel.text = fdata.detail;
}
@end
