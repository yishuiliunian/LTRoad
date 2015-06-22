//
//  LTGlobals.h
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import "LTColors.h"
#import "LTFont.h"
#import "LTUserDataManager.h"
#import "LTAppearenceTools.h"
#import "LKHaneke.h"
#import <DZImageCache.h>
#import "MSLog.h"
#import "LTAccountManager.h"
#import "MUAlertPool.h"
FOUNDATION_EXTERN NSString* LTCellIdentifierFromClass(Class cla);
#define LTCellMapPairWithClass(dataCla , cellCla) LTCellIdentifierFromClass([dataCla class]) : [cellCla class]
FOUNDATION_EXPORT NSArray* LTSpereateStringToArray(NSString* str);



#define LTMantleMapPair(key, v) @""#key : @""#v
#define LTMantleSameMapPair(k) LTMantleMapPair(k , k)

FOUNDATION_EXTERN NSString* LTApplicationVersion();

#define DEFINE_Mantle_JSONTranformer_Function_1( name ,c,sub) \
+ (NSValueTransformer*) name##sub {\
return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[c class]];\
}
#define DEFINE_Mantle_JSONTranformer_Function( name ,c) DEFINE_Mantle_JSONTranformer_Function_1( name ,c, JSONTransformer)

#define __DEFINE_URL_Tansform(name,sub) \
+ (NSValueTransformer*) name##sub \
{ \
return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName]; \
}


#define __DEFINE_Mantle_JSONTranformer_Function_Array( name ,c,sub) \
+ (NSValueTransformer*) name##sub {\
return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:[NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[c class]]];\
}
#define DEFINE_Mantle_Array_JSONTranformer_Function( name ,c) __DEFINE_Mantle_JSONTranformer_Function_Array( name ,c, JSONTransformer)


#define DEFINE_URL_Tansform(name) __DEFINE_URL_Tansform(name,JSONTransformer)




FOUNDATION_EXTERN NSURL* LTNSURLFromString(NSString* string);

#define STR_TO_URL(str)    [NSURL URLWithString:str]
extern NSString* TIME_TO_STR(int64_t timeStamp);

FOUNDATION_EXTERN NSString*  ENSURE_STR(id object);

//date

FOUNDATION_EXTERN NSDate* LTDateFromServerTimeInterval(int64_t time);
FOUNDATION_EXTERN NSString* LTDateShortStringFromInterval(int64_t time);
