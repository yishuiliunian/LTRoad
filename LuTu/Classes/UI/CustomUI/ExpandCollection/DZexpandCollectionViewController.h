//
//  DZexpandCollectionViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZExpandCollectionView.h"
@interface DZexpandCollectionViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong, readonly) DZExpandCollectionView* expandCollectionView;
@property (nonatomic, strong) NSArray* items;
@end
