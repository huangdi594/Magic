//
//	Index.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Index.h"

NSString *const kIndexDetail = @"detail";
NSString *const kIndexIname = @"iname";
NSString *const kIndexIndex = @"index";
NSString *const kIndexIvalue = @"ivalue";

@interface Index ()
@end
@implementation Index




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kIndexDetail] isKindOfClass:[NSNull class]]){
		self.detail = dictionary[kIndexDetail];
	}	
	if(![dictionary[kIndexIname] isKindOfClass:[NSNull class]]){
		self.iname = dictionary[kIndexIname];
	}	
	if(![dictionary[kIndexIndex] isKindOfClass:[NSNull class]]){
		self.index = dictionary[kIndexIndex];
	}	
	if(![dictionary[kIndexIvalue] isKindOfClass:[NSNull class]]){
		self.ivalue = dictionary[kIndexIvalue];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.detail != nil){
		dictionary[kIndexDetail] = self.detail;
	}
	if(self.iname != nil){
		dictionary[kIndexIname] = self.iname;
	}
	if(self.index != nil){
		dictionary[kIndexIndex] = self.index;
	}
	if(self.ivalue != nil){
		dictionary[kIndexIvalue] = self.ivalue;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.detail != nil){
		[aCoder encodeObject:self.detail forKey:kIndexDetail];
	}
	if(self.iname != nil){
		[aCoder encodeObject:self.iname forKey:kIndexIname];
	}
	if(self.index != nil){
		[aCoder encodeObject:self.index forKey:kIndexIndex];
	}
	if(self.ivalue != nil){
		[aCoder encodeObject:self.ivalue forKey:kIndexIvalue];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.detail = [aDecoder decodeObjectForKey:kIndexDetail];
	self.iname = [aDecoder decodeObjectForKey:kIndexIname];
	self.index = [aDecoder decodeObjectForKey:kIndexIndex];
	self.ivalue = [aDecoder decodeObjectForKey:kIndexIvalue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Index *copy = [Index new];

	copy.detail = [self.detail copy];
	copy.iname = [self.iname copy];
	copy.index = [self.index copy];
	copy.ivalue = [self.ivalue copy];

	return copy;
}
@end