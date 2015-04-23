//
//  MSToken.h
//  MoShang
//
//  Created by stonedong on 15/2/1.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>
@interface MSToken : MTLModel
@property (nonatomic, strong) NSString* account;
@property (nonatomic, strong) NSString* token;
@property (nonatomic, strong) NSDate* experiedDate;

- (instancetype) initWithToken:(NSString*)token account:(NSString*)account;
@end
