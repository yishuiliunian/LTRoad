//
//  SAReqAuthProcess.h
//  Pods
//
//  Created by stonedong on 15/3/11.
//
//

#import <Foundation/Foundation.h>
#import "SAToken.h"
@class SAReqAuthProcess;
@protocol SAReqAuthDelegate <NSObject>

- (void) authProcess:(SAReqAuthProcess*)process succeedWithToken:(SAToken*)token;
- (void) authProcess:(SAReqAuthProcess *)process failtWithError:(NSError*) error;

@end
@interface SAReqAuthProcess : NSObject
@property (nonatomic, strong, readonly) NSString* processID;
@property (nonatomic, weak) id<SAReqAuthDelegate> delegate;
- (void) request;
- (BOOL) canRequest:(NSError* __autoreleasing*)error;
- (BOOL) handleOpenURL:(NSURL*)url;
@end
