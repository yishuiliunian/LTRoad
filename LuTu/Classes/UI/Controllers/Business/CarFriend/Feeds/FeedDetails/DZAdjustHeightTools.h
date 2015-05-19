//
//  DZAdjustHeightTools.h
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DEFINE_PROPERTY_HEIGHT  @property (nonatomic, assign) CGFloat height;

#define FILL_CALCULATE_HEIGHT_FUNC  - (CGFloat) calculateHeight
#define ADD_OBSERVER_TO_HEIGHT(view) [view addObserver:self forKeyPath:@"height" options:NSKeyValueObservingOptionNew context:nil];
#define REMOVE_OBSERVER_TO_HEIGHT(view)  [view removeObserver:self forKeyPath:@"height"];


#define HANDLE_HEIGHT_CHANGED_FOR_VIEW(v) \
if (object == v && [keyPath isEqualToString:@"height"]) { \
self.height = [self calculateHeight]; \
}
@interface DZAdjustHeightTools : NSObject

@end
