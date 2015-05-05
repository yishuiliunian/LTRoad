//
//  LTMyFavoriteReq.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyFavoriteReq.h"
#import "LTUIMyFavorite.h"
@implementation LTMyFavoriteReq
@synthesize pageId;
@synthesize pageSize;
- (NSString*) method
{
    return @"/user/favorite/simple/list";
}

- (void) onSuccess:(id)retObject
{
    
}

#ifdef DEBUG
- (NSArray*) fakeDatas
{
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0 ; i < 109; i++) {
        LTUIMyFavorite* f = [LTUIMyFavorite new];
        f.avatarImageURL = [NSURL URLWithString:@"http://avatar.csdn.net/2/5/4/1_iorchid.jpg"];
        f.title = @"去大理";
        f.detail = @"01/11/234";
        [array addObject:f];
    }
    return array;
}
- (void) onError:(NSError *)error
{
    [self doUIOnSuccced:[self fakeDatas]];
}
#endif
@end
