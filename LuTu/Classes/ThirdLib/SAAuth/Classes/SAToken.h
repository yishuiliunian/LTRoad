//
//  SAToken.h
//  Pods
//
//  Created by stonedong on 15/3/11.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WXApi.h"
#import <JSONModel.h>
typedef enum {
    SATokenWechat,
    SATokenQQ
}SATokenType;

FOUNDATION_EXTERN int SATokenTypeTOInt(SATokenType type);

@protocol SAToken <NSObject>

@end
@interface SAToken : JSONModel
//@property (nonatomic, assign) SATokenType type;
@property (nonatomic, strong) NSString<Optional>* token;
@property (nonatomic, strong) NSString<Optional>* openID;
@property (nonatomic, strong) NSString<Optional>* userAvaterURL;
@property (nonatomic, strong) NSDictionary<Optional>* userInfos;
@property (nonatomic, strong) NSString<Optional>* nickName;
@end
