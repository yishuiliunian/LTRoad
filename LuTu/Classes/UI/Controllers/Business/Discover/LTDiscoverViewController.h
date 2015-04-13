//
//  LTDiscoverViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    LTLayoutTypeGrid,
    LTLayoutTypeCover
}LTLayoutType;
@interface LTDiscoverViewController : UICollectionViewController
- (instancetype) initWithLayoutType:(LTLayoutType)type;
@end
