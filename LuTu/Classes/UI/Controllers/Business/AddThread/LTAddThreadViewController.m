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
#import <LMDropdownView.h>
#import "LTTopActionButton.h"
#import "MUAlertPool.h"
#import "UIButton+decorate.h"
#import "LTUPloadImageManager.h"
#import "LTImageCollectionViewCell.h"
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
    
    [_imageButton decorateWithImage:@"pic_cion" highLightImage:@"pic_cion_click" title:nil];
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

static NSString* kImageCellIdentifier = @"xxx";

@interface LTAddThreadViewController () <MSRequestUIDelegate,
UITableViewDelegate,
UITableViewDataSource,
LTToggleActionProtocol,
UIActionSheetDelegate,
UINavigationControllerDelegate,
UIImagePickerControllerDelegate,
LTUploadManagerDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource
>
{
    CGFloat _keyboardHeight;
    BOOL _tryPost;
}
DEFINE_PROPERTY_STRONG(UITextField*, titleTextFiled);
DEFINE_PROPERTY_STRONG(SZTextView*, contentTextView);
DEFINE_PROPERTY_STRONG(LTInputToolbar*, inputToolbar);
DEFINE_PROPERTY_STRONG_UIImageView(lineView);
DEFINE_PROPERTY_STRONG(UITableView*, menuTableView);
DEFINE_PROPERTY_STRONG(LMDropdownView*, dropDownView);
DEFINE_PROPERTY_STRONG(LTTopActionButton*, actionButton);
DEFINE_PROPERTY_STRONG(LTUPloadImageManager*, uploadImageManager);
DEFINE_PROPERTY_STRONG(UICollectionView*, selectedImageCollectionView);
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
    _keyboardHeight = height;
    CGRect contentRect = CGRectShrink(self.view.bounds, height, CGRectMaxYEdge);
    CGRect toolbarRect;
    CGRectDivide(contentRect, &toolbarRect, &contentRect, 44, CGRectMaxYEdge);
    
    CGRect titleRect;
    CGRect contentTextRect;

    CGRect imageScrollRect;
    CGRectDivide(contentRect, &titleRect, &contentTextRect, 44, CGRectMinYEdge);
    
    if (_uploadImageManager.allImages.count) {
        CGRectDivide(contentTextRect, &imageScrollRect, &contentTextRect, 60, CGRectMaxYEdge);
    }
    
    _inputToolbar.frame = toolbarRect;
    _titleTextFiled.frame = titleRect;
    _contentTextView.frame = contentTextRect;
    _selectedImageCollectionView.frame = imageScrollRect;
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
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(60, 60);
    _selectedImageCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _selectedImageCollectionView.dataSource = self;
    _selectedImageCollectionView.delegate =self;
    [_selectedImageCollectionView registerClass:[LTImageCollectionViewCell class] forCellWithReuseIdentifier:kImageCellIdentifier];
    [self.view addSubview:_selectedImageCollectionView];
    //
    _titleTextFiled.placeholder = @"标题";
    _contentTextView.placeholder = @"内容";
    _lineView.backgroundColor = LTColorGrayNormal();
    
    //
    _inputToolbar.backgroundColor = LTColorToolbarGray();
    _menuTableView = [UITableView new];
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
    [_menuTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    
    _dropDownView = [[LMDropdownView alloc] init];
    _dropDownView.menuContentView = self.menuTableView;
}

static NSString*  kCellIdentifier = @"kCellIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initAllSubViews];
    
    UIBarButtonItem* postItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(tryPost)];
    self.navigationItem.rightBarButtonItem = postItem;

    // Do any additional setup after loading the view.
    
    _actionButton= [LTTopActionButton new];
    [_actionButton setTitle:@"xxxx" forState:UIControlStateNormal];
    _actionButton.frame = CGRectMake(0, 0, 400, 44);
    [_actionButton addToggleActionTarget:self];
    self.navigationItem.titleView = _actionButton;
    //
    
    [_inputToolbar.imageButton addTarget:self action:@selector(selectImage) forControlEvents:UIControlEventTouchUpInside];
    //
    _uploadImageManager = [LTUPloadImageManager new];
    _uploadImageManager.delgate = self;
}

- (void) uploadManagerSuccess:(LTUPloadImageManager *)m
{
    if (_tryPost) {
        [self postFeed];
    }
}

- (void) uploadManager:(LTUPloadImageManager *)m uploadError:(NSError *)error
{
    MUAlertShowError(error.localizedDescription);
}
- (void) selectImage
{
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相册",@"相机", nil];
    [actionSheet showInView:self.navigationController.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString* title = [actionSheet buttonTitleAtIndex:buttonIndex];
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    if ([title isEqualToString:@"相机"]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if ([title isEqualToString:@"相册"])
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    picker.delegate = self;
    [self.navigationController presentViewController:picker animated:YES completion:nil];
}


- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* image = info[UIImagePickerControllerOriginalImage];
    LTUploadImage* upImage = [[LTUploadImage alloc] initWithImage:image];
    [_uploadImageManager uploadImage:upImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self layoutWithKeybordHeight:_keyboardHeight];
    [_selectedImageCollectionView reloadData];
}

- (void) toggleActionButton:(LTTopActionButton *)sender
{
    if (sender.isAction) {
        _menuTableView.frame = CGRectMake(self.menuTableView.frame.origin.x,
                                          self.menuTableView.frame.origin.y,
                                          CGRectGetWidth(self.view.frame),
                                          MIN(CGRectGetHeight(self.view.bounds) /2, self.allCarClubs.count*44));
        [_menuTableView reloadData];
        [_dropDownView showInView:self.view withFrame:self.view.bounds];
    } else {
        [_dropDownView hide];
    }
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    MUAlertShowError(error.localizedDescription);
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    MUAlertShowSuccess(@"发布成功");
}

- (void) tryPost
{
    if (!_titleTextFiled.text || [_titleTextFiled.text isEqualToString:@""]) {
        MUAlertShowError(@"标题输一下呗");
        return;
    }
    [self postFeed];
}
- (void) postFeed
{
    
    _tryPost = YES;
    if (_uploadImageManager.uploading) {
        MUAlertShowLoading(@"正在上传图片");
        return;
    }
    NSMutableArray* array = [NSMutableArray new];
    for (LTUploadImage* image in _uploadImageManager.allImages) {
        if (!image.uploaded) {
            MUAlertShowError(@"还有图片没有上传，不能发布");
            return;
        }
        if (image.imageID) {
            [array addObject:image.imageID];
        }
    }
    
    LTThreadNewReq* req = [LTThreadNewReq new];
    req.creatorId = LTCurrentAccount.accountID;
    req.clubId = self.selectedCarMeet.clubID;
    req.title = _titleTextFiled.text;
    req.images = array;
    req.content = _contentTextView.text;
    MSPerformRequestWithDelegateSelf(req);
    MUAlertShowLoading(@"发布中...");
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self layoutWithKeybordHeight:0];
    [_titleTextFiled becomeFirstResponder];
    [self showCarClubInfo];
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

- (void) showCarClubInfo
{
    [_actionButton setTitle:self.selectedCarMeet.title forState:UIControlStateNormal];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allCarClubs.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    LTUICarMeet* carmeet = self.allCarClubs[indexPath.row];
    cell.textLabel.text = carmeet.title;
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTUICarMeet* carmeet = self.allCarClubs[indexPath.row];
    self.selectedCarMeet = carmeet;
    [self showCarClubInfo];
    [_dropDownView hide];
    _actionButton.isAction = NO;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

//

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _uploadImageManager.allImages.count;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LTImageCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCellIdentifier forIndexPath:indexPath];
    
    cell.imageView.image = [_uploadImageManager.allImages[indexPath.row] image];
    return cell;
}
@end
