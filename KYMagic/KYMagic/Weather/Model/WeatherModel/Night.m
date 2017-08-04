//
//	Night.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Night.h"

NSString *const kNightImg = @"img";
NSString *const kNightTemplow = @"templow";
NSString *const kNightWeather = @"weather";
NSString *const kNightWinddirect = @"winddirect";
NSString *const kNightWindpower = @"windpower";

@interface Night ()
@end
@implementation Night




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kNightImg] isKindOfClass:[NSNull class]]){
		self.img = dictionary[kNightImg];
	}	
	if(![dictionary[kNightTemplow] isKindOfClass:[NSNull class]]){
		self.templow = dictionary[kNightTemplow];
	}	
	if(![dictionary[kNightWeather] isKindOfClass:[NSNull class]]){
		self.weather = dictionary[kNightWeather];
	}	
	if(![dictionary[kNightWinddirect] isKindOfClass:[NSNull class]]){
		self.winddirect = dictionary[kNightWinddirect];
	}	
	if(![dictionary[kNightWindpower] isKindOfClass:[NSNull class]]){
		self.windpower = dictionary[kNightWindpower];
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
		dictionary[kNightImg] = self.img;
	}
	if(self.templow != nil){
		dictionary[kNightTemplow] = self.templow;
	}
	if(self.weather != nil){
		dictionary[kNightWeather] = self.weather;
	}
	if(self.winddirect != nil){
		dictionary[kNightWinddirect] = self.winddirect;
	}
	if(self.windpower != nil){
		dictionary[kNightWindpower] = self.windpower;
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
		[aCoder encodeObject:self.img forKey:kNightImg];
	}
	if(self.templow != nil){
		[aCoder encodeObject:self.templow forKey:kNightTemplow];
	}
	if(self.weather != nil){
		[aCoder encodeObject:self.weather forKey:kNightWeather];
	}
	if(self.winddirect != nil){
		[aCoder encodeObject:self.winddirect forKey:kNightWinddirect];
	}
	if(self.windpower != nil){
		[aCoder encodeObject:self.windpower forKey:kNightWindpower];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.img = [aDecoder decodeObjectForKey:kNightImg];
	self.templow = [aDecoder decodeObjectForKey:kNightTemplow];
	self.weather = [aDecoder decodeObjectForKey:kNightWeather];
	self.winddirect = [aDecoder decodeObjectForKey:kNightWinddirect];
	self.windpower = [aDecoder decodeObjectForKey:kNightWindpower];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Night *copy = [Night new];

	copy.img = [self.img copy];
	copy.templow = [self.templow copy];
	copy.weather = [self.weather copy];
	copy.winddirect = [self.winddirect copy];
	copy.windpower = [self.windpower copy];

	return copy;
}
@end