
#import "PMRouteSearchInfo.h"
@implementation PMRouteSearchInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"carType":@"carType",
@"createTime":@"createTime",
@"favCount":@"favCount",
@"introImageUrl":@"introImageUrl",
@"location":@"location",
@"name":@"name",
@"routeId":@"routeId",
@"routeStatus":@"routeStatus",
@"status":@"status",
@"totalDistance":@"totalDistance",
@"totalTime":@"totalTime",

            };
}

+ (NSValueTransformer*) carTypeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) favCountJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introImageUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) locationJSONTransformer
{
 return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:[NSString class]]) {
            NSString* str = value;
            NSArray* values = [str componentsSeparatedByString:@","];
            if (values.count == 2) {
                PMLinePoint* point = [PMLinePoint new];
                point.lat = [values[0] floatValue];
                point.lng = [values[1] floatValue];
                *success = YES;
                return point;
            }
        }

        PMLinePoint* point = [PMLinePoint new];
        point.lat = 0;
        point.lng = 0;
        *success = YES;
        return point;

    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:[PMLinePoint class]]) {
            PMLinePoint* point = (PMLinePoint*) value;
            *success = YES;
            return [NSString stringWithFormat:@"%f,%f", point.lat, point.lng];
        }
        return nil;
    }];

}


+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) routeIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) routeStatusJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) statusJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) totalDistanceJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) totalTimeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"createTime"])
	{
	   self.createTime = 0;
	}


}

@end
