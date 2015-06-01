//
//  LTRouteDetailViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRouteDetailViewController.h"
#import "LTRouteDetailReq.h"
#import "LTLineHeaderView.h"
#import "LTLine.h"
#import "LTLinePoiCell.h"
#import "LTGlobals.h"
#import <DZGeometryTools.h>
#import "LTAdjustFrameTable.h"
#import "UIViewController+Additions.h"
#import "LTGlobals.h"
#import "LTRouteCollectReq.h"
@interface LTRouteDetailViewController () <MSRequestUIDelegate, BMKMapViewDelegate>
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
    
    
    UIBarButtonItem* shareItem = [self customBarButtonItemWithTarget:self selector:@selector(shareCurrentRoute) image:@"top_share" highlightImage:@"top_share_click"];
    UIBarButtonItem* favItem = [self customBarButtonItemWithTarget:self selector:@selector(addFav) image:@"top_adfav" highlightImage:@"top_adfav_click"];
    
    self.navigationItem.rightBarButtonItems = @[favItem, shareItem];
}

- (void) shareCurrentRoute
{
    
}

- (void) addFav
{
    LTRouteCollectReq* favReq = [LTRouteCollectReq new];
    favReq.routeId = _routeID;
    favReq.creatorId = LTCurrentAccount.accountID;
    MSPerformRequestWithDelegateSelf(favReq);
}


- (void) reloadDetails
{
    LTRouteDetailReq* detailReq = [LTRouteDetailReq new];
    detailReq.routeId = _routeID;
    MSPerformRequestWithDelegateSelf(detailReq);
}
- (void) reloadAllData
{
    [self reloadDetails];
}

- (void) loadLineUIData
{
    self.title = _uiDataLine.routeName;
    _headView.detailContentView.timeView.topLabel.text = _uiDataLine.timeCoast;
    _headView.detailContentView.timeView.detailLabel.text = @"时间";
    
    _headView.detailContentView.carStyleView.detailLabel.text = _uiDataLine.carStyle;
    _headView.detailContentView.carStyleView.imageView.image = _uiDataLine.carStyleImage;
    
    _headView.detailContentView.distanceView.detailLabel.text = @"Km";
    _headView.detailContentView.distanceView.topLabel.text = _uiDataLine.distance;
    
    _headView.detailContentView.roadStatusView.detailLabel.text = @"路况";
    _headView.detailContentView.roadStatusView.topLabel.text = _uiDataLine.rloadCondition;
    _headView.routeInfoView.detailLabel.text = _uiDataLine.introText;
    _headView.routeInfoView.badgeContentView.badgeItems = _uiDataLine.categoryBadgeArray;
    
    _headView.startEndView.startPointView.detailLabel.text = _uiDataLine.startPointName;
    _headView.startEndView.endPointView.detailLabel.text = _uiDataLine.endPointName;
    [self loadMapData];
}

- (void) loadMapData
{
    NSArray* lines = _uiDataLine.line.lines;
    
    if (lines.count < 1) {
        return;
    }
    
    NSInteger coorCount = lines.count * 2;
    CLLocationCoordinate2D* coors = malloc(sizeof(CLLocationCoordinate2D)*lines.count*2);
    for (int i = 0; i < lines.count; i++) {
        CLLocationCoordinate2D startC = coors[i];
        CLLocationCoordinate2D endC = coors[i+1];
        PMLineSegment* seg = lines[i];
        startC.latitude = seg.locationStart.lat;
        startC.longitude = seg.locationStart.lng;
        
        endC.latitude = seg.locationEnd.lat;
        endC.longitude = seg.locationEnd.lng;
    }
    BMKPolyline* polyline = [BMKPolyline polylineWithCoordinates:coors count:coorCount];
    _headView.mapView.delegate = self;
    [_headView.mapView addOverlay:polyline];
    free(coors);
}
- (BMKOverlayView*) mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay
{
    if ([overlay isKindOfClass:[BMKPolyline class]]){
        BMKPolylineView* polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay] ;
        polylineView.strokeColor = [[UIColor purpleColor] colorWithAlphaComponent:1];
        polylineView.lineWidth = 5.0;
        return polylineView;
    }
    return nil;
}
- (void)  replaceDataWithPOIS:(NSArray*)pois
{
}

- (void) onHandleRemoteRoteDetail:(PMRouteDetailRsp*)pmline
{
    _uiDataLine = [[LTLine alloc] initWithPMLine:pmline];
    [self loadLineUIData];
    
    NSMutableArray* uiPois = [NSMutableArray new];
    for (PMRoutePoiInfo* info in pmline.pois) {
        LTUIPoi* p = [[LTUIPoi alloc] initWithPOI:info];
        [uiPois addObject:p];
    }
    _allCellDatas = uiPois;
    [self.tableView reloadData];
}

- (void) onHandleAddFavResponse:(PMNullModel*)model
{
    
}
- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}
- (void) request:(MSRequest *)request onSucced:(id)object
{
     if ([request isKindOfClass:[LTRouteDetailReq class]]) {
        [self onHandleRemoteRoteDetail:object];
     } else if ([request isKindOfClass:[LTRouteCollectReq class]]) {
         [self onHandleAddFavResponse:object];
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
