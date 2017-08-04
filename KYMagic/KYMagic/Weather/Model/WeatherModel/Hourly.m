//
//	Hourly.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Hourly.h"

NSString *const kHourlyImg = @"img";
NSString *const kHourlyTemp = @"temp";
NSString *const kHourlyTime = @"time";
NSString *const kHourlyWeather = @"weather";

@interface Hourly ()
@end
@implementation Hourly




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kHourlyImg] isKindOfClass:[NSNull class]]){
		self.img = dictionary[kHourlyImg];
	}	
	if(![dictionary[kHourlyTemp] isKindOfClass:[NSNull class]]){
		self.temp = dictionary[kHourlyTemp];
	}	
	if(![dictionary[kHourlyTime] isKindOfClass:[NSNull class]]){
		self.time = dictionary[kHourlyTime];
	}	
	if(![dictionary[kHourlyWeather] isKindOfClass:[NSNull class]]){
		self.weather = dictionary[kHourlyWeather];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.img != nil){
		dictionary[kHourlyImg] = self.img;
	}
	if(self.temp != nil){
		dictionary[kHourlyTemp] = self.temp;
	}
	if(self.time != nil){
		dictionary[kHourlyTime] = self.time;
	}
	if(self.weather != nil){
		dictionary[kHourlyWeather] = self.weather;
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
	if(self.img != nil){
		[aCoder encodeObject:self.img forKey:kHourlyImg];
	}
	if(self.temp != nil){
		[aCoder encodeObject:self.temp forKey:kHourlyTemp];
	}
	if(self.time != nil){
		[aCoder encodeObject:self.time forKey:kHourlyTime];
	}
	if(self.weather != nil){
		[aCoder encodeObject:self.weather forKey:kHourlyWeather];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.img = [aDecoder decodeObjectForKey:kHourlyImg];
	self.temp = [aDecoder decodeObjectForKey:kHourlyTemp];
	self.time = [aDecoder decodeObjectForKey:kHourlyTime];
	self.weather = [aDecoder decodeObjectForKey:kHourlyWeather];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Hourly *copy = [Hourly new];

	copy.img = [self.img copy];
	copy.temp = [self.temp copy];
	copy.time = [self.time copy];
	copy.weather = [self.weather copy];

	return copy;
}
@end