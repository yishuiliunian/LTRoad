//
//  LTAddThreadViewController.m
//  LuTu
//
//  Created by stonedong on 15/6/3.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTAddThreadViewController.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import <SZTextView.h>
#import "LTGlobals.h"
#import "LTThreadNewReq.h"

@interface LTInputToolbar  : UIView
DEFINE_PROPERTY_STRONG_UIImageView(backgroudImageView);
DEFINE_PROPERTY_STRONG_UIButton(imageButton);
@end

@implementation LTInputToolbar
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_backgroudImageView);
    INIT_SUBVIEW_UIButton(self, _imageButton);
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGSize buttonSize = CGSizeMake(30, 30);
    _backgroudImageView.frame = self.bounds;
    _imageButton.frame = CGRectMake(10, CGRectHeightOffsetCenter(self.bounds, buttonSize.height), buttonSize.width, buttonSize.height);
}
@end


@interface LTAddThreadViewController () <MSRequestUIDelegate>
DEFINE_PROPERTY_STRONG(UITextField*, titleTextFiled);
DEFINE_PROPERTY_STRONG(SZTextView*, contentTextView);
DEFINE_PROPERTY_STRONG(LTInputToolbar*, inputToolbar);
DEFINE_PROPERTY_STRONG_UIImageView(lineView);
@end

@implementation LTAddThreadViewController


- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) {
        return self;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboarShow:) name:UIKeyboardDidShowNotification object:nil];
    return self;
}


- (void) layoutWithKeybordHeight:(CGFloat) height
{
    CGRect contentRect = CGRectShrink(self.view.bounds, height, CGRectMaxYEdge);
    CGRect toolbarRect;
    CGRectDivide(contentRect, &toolbarRect, &contentRect, 44, CGRectMaxYEdge);
    
    CGRect titleRect;
    CGRect detailRect;
    CGRect imageScrollRect;
    CGRectDivide(contentRect, &titleRect, &detailRect, 44, CGRectMinYEdge);
    
    
    _inputToolbar.frame = toolbarRect;
    _titleTextFiled.frame = titleRect;
    _contentTextView.frame = detailRect;
    _lineView.frame = CGRectMake(0, CGRectGetMaxY(titleRect), CGRectGetViewControllerWidth, 1);
    
}

- (void) handleKeyboarShow:(NSNotification*)nc
{
    CGRect showRect = [nc.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [self layoutWithKeybordHeight:CGRectGetHeight(showRect)];
}


- (void) initAllSubViews
{
    INIT_SUBVIEW(self.view, UITextField, _titleTextFiled);
    INIT_SUBVIEW(self.view, SZTextView, _contentTextView);
    INIT_SUBVIEW(self.view, LTInputToolbar, _inputToolbar);
    INIT_SUBVIEW_UIImageView(self.view, _lineView);
    //
    _titleTextFiled.placeholder = @"标题";
    _contentTextView.placeholder = @"内容";
    _lineView.backgroundColor = LTColorGrayNormal();
    
    //
    _inputToolbar.backgroundColor = LTColorGrayNormal();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initAllSubViews];
    
    UIBarButtonItem* postItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(postFeed)];
    self.navigationItem.rightBarButtonItem = postItem;

    // Do any additional setup after loading the view.
}


- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    
}
- (void) postFeed
{
    LTThreadNewReq* req = [LTThreadNewReq new];
    req.creatorId = LTCurrentAccount.accountID;
    req.clubId = @"1";
    req.title = _titleTextFiled.text;
    req.content = _contentTextView.text;
    
    MSPerformRequestWithDelegateSelf(req);
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self layoutWithKeybordHeight:0];
    [_titleTextFiled becomeFirstResponder];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}
@end
