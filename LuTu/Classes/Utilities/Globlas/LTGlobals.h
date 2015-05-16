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



FOUNDATION_EXTERN NSURL* LTNSURLFromString(NSString* string);