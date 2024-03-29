
#import "PMRoutePoiInfo.h"
@implementation PMRoutePoiInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"poiId":@"poiId",
@"routeId":@"routeId",
@"name":@"name",
@"type":@"type",
@"cover":@"cover",
@"routeIndex":@"routeIndex",
@"arrivalTime":@"arrivalTime",
@"location":@"location",
@"introImageUrl":@"introImageUrl",
@"introText":@"introText",

            };
}

+ (NSValueTransformer*) poiIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) routeIdJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) nameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) arrivalTimeJSONTransformer
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
                point.lng = [values[0] floatValue];
                point.lat = [values[1] floatValue];
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


+ (NSValueTransformer*) introImageUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) introTextJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"type"])
	{
	   self.type = 0;
	}

else if([key isEqualToString:@"cover"])
	{
	   self.cover = 0;
	}

else if([key isEqualToString:@"routeIndex"])
	{
	   self.routeIndex = 0;
	}


}

@end
