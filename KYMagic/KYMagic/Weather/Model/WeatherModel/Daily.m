//
//	Daily.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Daily.h"

NSString *const kDailyDate = @"date";
NSString *const kDailyDay = @"day";
NSString *const kDailyNight = @"night";
NSString *const kDailySunrise = @"sunrise";
NSString *const kDailySunset = @"sunset";
NSString *const kDailyWeek = @"week";

@interface Daily ()
@end
@implementation Daily




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDailyDate] isKindOfClass:[NSNull class]]){
		self.date = dictionary[kDailyDate];
	}	
	if(![dictionary[kDailyDay] isKindOfClass:[NSNull class]]){
		self.day = [[Day alloc] initWithDictionary:dictionary[kDailyDay]];
	}

	if(![dictionary[kDailyNight] isKindOfClass:[NSNull class]]){
		self.night = [[Night alloc] initWithDictionary:dictionary[kDailyNight]];
	}

	if(![dictionary[kDailySunrise] isKindOfClass:[NSNull class]]){
		self.sunrise = dictionary[kDailySunrise];
	}	
	if(![dictionary[kDailySunset] isKindOfClass:[NSNull class]]){
		self.sunset = dictionary[kDailySunset];
	}	
	if(![dictionary[kDailyWeek] isKindOfClass:[NSNull class]]){
		self.week = dictionary[kDailyWeek];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.date != nil){
		dictionary[kDailyDate] = self.date;
	}
	if(self.day != nil){
		dictionary[kDailyDay] = [self.day toDictionary];
	}
	if(self.night != nil){
		dictionary[kDailyNight] = [self.night toDictionary];
	}
	if(self.sunrise != nil){
		dictionary[kDailySunrise] = self.sunrise;
	}
	if(self.sunset != nil){
		dictionary[kDailySunset] = self.sunset;
	}
	if(self.week != nil){
		dictionary[kDailyWeek] = self.week;
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
	if(self.date != nil){
		[aCoder encodeObject:self.date forKey:kDailyDate];
	}
	if(self.day != nil){
		[aCoder encodeObject:self.day forKey:kDailyDay];
	}
	if(self.night != nil){
		[aCoder encodeObject:self.night forKey:kDailyNight];
	}
	if(self.sunrise != nil){
		[aCoder encodeObject:self.sunrise forKey:kDailySunrise];
	}
	if(self.sunset != nil){
		[aCoder encodeObject:self.sunset forKey:kDailySunset];
	}
	if(self.week != nil){
		[aCoder encodeObject:self.week forKey:kDailyWeek];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.date = [aDecoder decodeObjectForKey:kDailyDate];
	self.day = [aDecoder decodeObjectForKey:kDailyDay];
	self.night = [aDecoder decodeObjectForKey:kDailyNight];
	self.sunrise = [aDecoder decodeObjectForKey:kDailySunrise];
	self.sunset = [aDecoder decodeObjectForKey:kDailySunset];
	self.week = [aDecoder decodeObjectForKey:kDailyWeek];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Daily *copy = [Daily new];

	copy.date = [self.date copy];
	copy.day = [self.day copy];
	copy.night = [self.night copy];
	copy.sunrise = [self.sunrise copy];
	copy.sunset = [self.sunset copy];
	copy.week = [self.week copy];

	return copy;
}
@end