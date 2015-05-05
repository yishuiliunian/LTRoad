//
//  LTUserCarClubReq.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUserCarClubReq.h"
#import "PMUserCarClub.h"
#import "MSLog.h"
@implementation LTUserCarClubReq

- (NSString*) method
{
    return @"/user/car_club/list";
}

- (void) onError:(NSError *)error
{
    [super onError:error];
}

- (void) onSuccess:(id)retObject
{
    NSDictionary* fakeData = @{
                               @"club_id": @1,
                               @"name":@ "深圳奔驰车友会",
                               @"intro_image_url": @"http://avatar.csdn.net/6/6/0/1_favormm.jpg",
                               @"member_count": @100,
                               @"thread_count": @2000
                               };
    NSArray* data = @[fakeData];
    NSMutableArray* userCarClubs = [NSMutableArray new];
    for (NSDictionary* club in data) {
        NSError* error = nil;
        PMUserCarClub* clubTemp = [[PMUserCarClub alloc] initWithDictionary:club error:&error];
        if (error) {
            DDLogError(@"%@",error);
            continue;
        }
        [userCarClubs addObject:clubTemp];
    }
    [self doUIOnSuccced:userCarClubs];
}

@end
