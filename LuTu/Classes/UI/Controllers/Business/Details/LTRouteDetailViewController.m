//
//  LTRouteDetailViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRouteDetailViewController.h"
#import "LTRouteDetailReq.h"
#import "LTRoutePOIReq.h"
#import "PMLine.h"
#import "LTLineHeaderView.h"
#import "LTLine.h"
#import "LTLinePoiCell.h"
#import "LTGlobals.h"
#import <DZGeometryTools.h>
#import "LTAdjustFrameTable.h"
@interface LTRouteDetailViewController () <MSRequestUIDelegate>
{
    NSArray* _allCellDatas;
    LTLineHeaderView* _headView;
    LTLine* _uiDataLine;
}
@end
@implementation LTRouteDetailViewController

static NSString* const kHeaderCellIdentifier = @"kHeaderCellIdentifier";
static NSString* const kPOICellIdentifier = @"kPOICellIdentifier";
- (instancetype) initWithRouteID:(NSString *)routeID
{
    self = [super init];
    if (!self) {
        return self;
    }
    
    _routeID = routeID;
    
    return self;
}

- (void) loadView
{
    LTAdjustFrameTable* tableView = [[LTAdjustFrameTable alloc] initWithFrame:CGRectLoadViewFrame];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    self.view = tableView;
}
- (void) loadHeaderView
{
    _headView = [LTLineHeaderView new];
    _headView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds),LTLineHeaderCellHeight);
    self.tableView.tableHeaderView = _headView;
}

- (void) loadCells
{
    [self.tableView registerClass:[LTLinePoiCell class] forCellReuseIdentifier:kPOICellIdentifier];
}

- (void) configureTableView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = LTColorBackgroundGray();
}
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self loadHeaderView];
    [self loadCells];
    [self configureTableView];
    [self reloadAllData];
}
- (void) reloadPOIS {
    LTRoutePOIReq* detailReq = [LTRoutePOIReq new];
    detailReq.routeID = _routeID;
    MSPerformRequestWithDelegateSelf(detailReq);
}

- (void) reloadDetails
{
    LTRouteDetailReq* detailReq = [LTRouteDetailReq new];
    detailReq.routeID = _routeID;
    MSPerformRequestWithDelegateSelf(detailReq);
}
- (void) reloadAllData
{
    [self reloadDetails];
    [self reloadPOIS];
}

- (void) loadLineUIData
{
    _headView.detailContentView.timeView.topLabel.text = _uiDataLine.timeCoast;
    _headView.detailContentView.timeView.detailLabel.text = @"时间";
    
    _headView.detailContentView.carStyleView.detailLabel.text = _uiDataLine.carStyle;
    _headView.detailContentView.carStyleView.imageView.image = _uiDataLine.carStyleImage;
    
    _headView.detailContentView.distanceView.detailLabel.text = @"Km";
    _headView.detailContentView.distanceView.topLabel.text = _uiDataLine.distance;
    
    _headView.detailContentView.roadStatusView.detailLabel.text = @"路况";
    _headView.detailContentView.roadStatusView.topLabel.text = @"良好";
    _headView.routeInfoView.detailLabel.text =  @"asdfaskldfjas啊打发会计师的回房间卡蝴蝶结开发和奥斯卡级东方红啊靠就收到货发框架啊是电话费夸奖啊说的话放假啊圣诞款金凤凰阿斯达克金凤凰阿克江是电话费框架啊说的话分看举案说法金卡水电费框架啊受打击发看啊合适的会计法哈斯东方红啊思考京东方啊空间是东方红夸奖啊收到货饭卡撒娇的发爱神的箭发卡机撒旦法哈师大会计法啊数据库的花费阿萨德飞阿萨德飞阿萨德飞和会计师东方红框架啊是电话费就卡萨丁和副科级撒旦法但是";
    _headView.routeInfoView.badgeContentView.badgeItems = @[LTCreateBadgeItemWithText(@"亲子游")];
}
- (void)  replaceDataWithPOIS:(NSArray*)pois
{
}

- (void) onHandleRemoteRoteDetail:(PMLine*)pmline
{
    _uiDataLine = [[LTLine alloc] initWithPMLine:pmline];
    [self loadLineUIData];
}

- (void) onHandleRemotePOIS:(NSArray*) pois
{
    _allCellDatas = pois;
    [self.tableView reloadData];
}
- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    if ([request isKindOfClass:[LTRoutePOIReq class]]) {
        [self onHandleRemotePOIS:object];
    } else if ([request isKindOfClass:[LTRouteDetailReq class]]) {
        [self onHandleRemoteRoteDetail:object];
    }
}


#pragma mark -

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allCellDatas.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTLinePoiCell* cell = [tableView dequeueReusableCellWithIdentifier:kPOICellIdentifier forIndexPath:indexPath];
    LTUIPoi* poi = _allCellDatas[indexPath.row];
    cell.poiInfos = poi;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTUIPoi* poi = _allCellDatas[indexPath.row];
    return poi.height;
}
@end
