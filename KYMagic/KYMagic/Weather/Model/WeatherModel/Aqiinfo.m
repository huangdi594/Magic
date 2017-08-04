//
//	Aqiinfo.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Aqiinfo.h"

NSString *const kAqiinfoAffect = @"affect";
NSString *const kAqiinfoColor = @"color";
NSString *const kAqiinfoLevel = @"level";
NSString *const kAqiinfoMeasure = @"measure";

@interface Aqiinfo ()
@end
@implementation Aqiinfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAqiinfoAffect] isKindOfClass:[NSNull class]]){
		self.affect = dictionary[kAqiinfoAffect];
	}	
	if(![dictionary[kAqiinfoColor] isKindOfClass:[NSNull class]]){
		self.color = dictionary[kAqiinfoColor];
	}	
	if(![dictionary[kAqiinfoLevel] isKindOfClass:[NSNull class]]){
		self.level = dictionary[kAqiinfoLevel];
	}	
	if(![dictionary[kAqiinfoMeasure] isKindOfClass:[NSNull class]]){
		self.measure = dictionary[kAqiinfoMeasure];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.affect != nil){
		dictionary[kAqiinfoAffect] = self.affect;
	}
	if(self.color != nil){
		dictionary[kAqiinfoColor] = self.color;
	}
	if(self.level != nil){
		dictionary[kAqiinfoLevel] = self.level;
	}
	if(self.measure != nil){
		dictionary[kAqiinfoMeasure] = self.measure;
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
	if(self.affect != nil){
		[aCoder encodeObject:self.affect forKey:kAqiinfoAffect];
	}
	if(self.color != nil){
		[aCoder encodeObject:self.color forKey:kAqiinfoColor];
	}
	if(self.level != nil){
		[aCoder encodeObject:self.level forKey:kAqiinfoLevel];
	}
	if(self.measure != nil){
		[aCoder encodeObject:self.measure forKey:kAqiinfoMeasure];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.affect = [aDecoder decodeObjectForKey:kAqiinfoAffect];
	self.color = [aDecoder decodeObjectForKey:kAqiinfoColor];
	self.level = [aDecoder decodeObjectForKey:kAqiinfoLevel];
	self.measure = [aDecoder decodeObjectForKey:kAqiinfoMeasure];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Aqiinfo *copy = [Aqiinfo new];

	copy.affect = [self.affect copy];
	copy.color = [self.color copy];
	copy.level = [self.level copy];
	copy.measure = [self.measure copy];

	return copy;
}
@end