//
//	Day.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Day.h"

NSString *const kDayImg = @"img";
NSString *const kDayTemphigh = @"temphigh";
NSString *const kDayWeather = @"weather";
NSString *const kDayWinddirect = @"winddirect";
NSString *const kDayWindpower = @"windpower";

@interface Day ()
@end
@implementation Day




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDayImg] isKindOfClass:[NSNull class]]){
		self.img = dictionary[kDayImg];
	}	
	if(![dictionary[kDayTemphigh] isKindOfClass:[NSNull class]]){
		self.temphigh = dictionary[kDayTemphigh];
	}	
	if(![dictionary[kDayWeather] isKindOfClass:[NSNull class]]){
		self.weather = dictionary[kDayWeather];
	}	
	if(![dictionary[kDayWinddirect] isKindOfClass:[NSNull class]]){
		self.winddirect = dictionary[kDayWinddirect];
	}	
	if(![dictionary[kDayWindpower] isKindOfClass:[NSNull class]]){
		self.windpower = dictionary[kDayWindpower];
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
		dictionary[kDayImg] = self.img;
	}
	if(self.temphigh != nil){
		dictionary[kDayTemphigh] = self.temphigh;
	}
	if(self.weather != nil){
		dictionary[kDayWeather] = self.weather;
	}
	if(self.winddirect != nil){
		dictionary[kDayWinddirect] = self.winddirect;
	}
	if(self.windpower != nil){
		dictionary[kDayWindpower] = self.windpower;
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
		[aCoder encodeObject:self.img forKey:kDayImg];
	}
	if(self.temphigh != nil){
		[aCoder encodeObject:self.temphigh forKey:kDayTemphigh];
	}
	if(self.weather != nil){
		[aCoder encodeObject:self.weather forKey:kDayWeather];
	}
	if(self.winddirect != nil){
		[aCoder encodeObject:self.winddirect forKey:kDayWinddirect];
	}
	if(self.windpower != nil){
		[aCoder encodeObject:self.windpower forKey:kDayWindpower];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.img = [aDecoder decodeObjectForKey:kDayImg];
	self.temphigh = [aDecoder decodeObjectForKey:kDayTemphigh];
	self.weather = [aDecoder decodeObjectForKey:kDayWeather];
	self.winddirect = [aDecoder decodeObjectForKey:kDayWinddirect];
	self.windpower = [aDecoder decodeObjectForKey:kDayWindpower];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Day *copy = [Day new];

	copy.img = [self.img copy];
	copy.temphigh = [self.temphigh copy];
	copy.weather = [self.weather copy];
	copy.winddirect = [self.winddirect copy];
	copy.windpower = [self.windpower copy];

	return copy;
}
@end