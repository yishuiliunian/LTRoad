
#import "PMThreadPostListRsp.h"
@implementation PMThreadPostListRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"offset":@"offset",
@"limit":@"limit",
@"total":@"total",
@"list":@"list",

            };
}
 

    + (NSValueTransformer*) listJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"PMThreadPostInfo")]];
    }
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"offset"])
	{
	   self.offset = 0;
	}

else if([key isEqualToString:@"limit"])
	{
	   self.limit = 0;
	}

else if([key isEqualToString:@"total"])
	{
	   self.total = 0;
	}


}

@end
