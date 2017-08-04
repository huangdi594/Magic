//
//	WeatherModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherModel.h"

NSString *const kWeatherModelAqi = @"aqi";
NSString *const kWeatherModelCity = @"city";
NSString *const kWeatherModelCitycode = @"citycode";
NSString *const kWeatherModelCityid = @"cityid";
NSString *const kWeatherModelDaily = @"daily";
NSString *const kWeatherModelDate = @"date";
NSString *const kWeatherModelHourly = @"hourly";
NSString *const kWeatherModelHumidity = @"humidity";
NSString *const kWeatherModelImg = @"img";
NSString *const kWeatherModelIndex = @"index";
NSString *const kWeatherModelPressure = @"pressure";
NSString *const kWeatherModelTemp = @"temp";
NSString *const kWeatherModelTemphigh = @"temphigh";
NSString *const kWeatherModelTemplow = @"templow";
NSString *const kWeatherModelUpdatetime = @"updatetime";
NSString *const kWeatherModelWeather = @"weather";
NSString *const kWeatherModelWeek = @"week";
NSString *const kWeatherModelWinddirect = @"winddirect";
NSString *const kWeatherModelWindpower = @"windpower";
NSString *const kWeatherModelWindspeed = @"windspeed";

@interface WeatherModel ()
@end
@implementation WeatherModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherModelAqi] isKindOfClass:[NSNull class]]){
		self.aqi = [[Aqi alloc] initWithDictionary:dictionary[kWeatherModelAqi]];
	}

	if(![dictionary[kWeatherModelCity] isKindOfClass:[NSNull class]]){
		self.city = dictionary[kWeatherModelCity];
	}	
	if(![dictionary[kWeatherModelCitycode] isKindOfClass:[NSNull class]]){
		self.citycode = dictionary[kWeatherModelCitycode];
	}	
	if(![dictionary[kWeatherModelCityid] isKindOfClass:[NSNull class]]){
		self.cityid = dictionary[kWeatherModelCityid];
	}	
	if(dictionary[kWeatherModelDaily] != nil && [dictionary[kWeatherModelDaily] isKindOfClass:[NSArray class]]){
		NSArray * dailyDictionaries = dictionary[kWeatherModelDaily];
		NSMutableArray * dailyItems = [NSMutableArray array];
		for(NSDictionary * dailyDictionary in dailyDictionaries){
			Daily * dailyItem = [[Daily alloc] initWithDictionary:dailyDictionary];
			[dailyItems addObject:dailyItem];
		}
		self.daily = dailyItems;
	}
	if(![dictionary[kWeatherModelDate] isKindOfClass:[NSNull class]]){
		self.date = dictionary[kWeatherModelDate];
	}	
	if(dictionary[kWeatherModelHourly] != nil && [dictionary[kWeatherModelHourly] isKindOfClass:[NSArray class]]){
		NSArray * hourlyDictionaries = dictionary[kWeatherModelHourly];
		NSMutableArray * hourlyItems = [NSMutableArray array];
		for(NSDictionary * hourlyDictionary in hourlyDictionaries){
			Hourly * hourlyItem = [[Hourly alloc] initWithDictionary:hourlyDictionary];
			[hourlyItems addObject:hourlyItem];
		}
		self.hourly = hourlyItems;
	}
	if(![dictionary[kWeatherModelHumidity] isKindOfClass:[NSNull class]]){
		self.humidity = dictionary[kWeatherModelHumidity];
	}	
	if(![dictionary[kWeatherModelImg] isKindOfClass:[NSNull class]]){
		self.img = dictionary[kWeatherModelImg];
	}	
	if(dictionary[kWeatherModelIndex] != nil && [dictionary[kWeatherModelIndex] isKindOfClass:[NSArray class]]){
		NSArray * indexDictionaries = dictionary[kWeatherModelIndex];
		NSMutableArray * indexItems = [NSMutableArray array];
		for(NSDictionary * indexDictionary in indexDictionaries){
			Index * indexItem = [[Index alloc] initWithDictionary:indexDictionary];
			[indexItems addObject:indexItem];
		}
		self.index = indexItems;
	}
	if(![dictionary[kWeatherModelPressure] isKindOfClass:[NSNull class]]){
		self.pressure = dictionary[kWeatherModelPressure];
	}	
	if(![dictionary[kWeatherModelTemp] isKindOfClass:[NSNull class]]){
		self.temp = dictionary[kWeatherModelTemp];
	}	
	if(![dictionary[kWeatherModelTemphigh] isKindOfClass:[NSNull class]]){
		self.temphigh = dictionary[kWeatherModelTemphigh];
	}	
	if(![dictionary[kWeatherModelTemplow] isKindOfClass:[NSNull class]]){
		self.templow = dictionary[kWeatherModelTemplow];
	}	
	if(![dictionary[kWeatherModelUpdatetime] isKindOfClass:[NSNull class]]){
		self.updatetime = dictionary[kWeatherModelUpdatetime];
	}	
	if(![dictionary[kWeatherModelWeather] isKindOfClass:[NSNull class]]){
		self.weather = dictionary[kWeatherModelWeather];
	}	
	if(![dictionary[kWeatherModelWeek] isKindOfClass:[NSNull class]]){
		self.week = dictionary[kWeatherModelWeek];
	}	
	if(![dictionary[kWeatherModelWinddirect] isKindOfClass:[NSNull class]]){
		self.winddirect = dictionary[kWeatherModelWinddirect];
	}	
	if(![dictionary[kWeatherModelWindpower] isKindOfClass:[NSNull class]]){
		self.windpower = dictionary[kWeatherModelWindpower];
	}	
	if(![dictionary[kWeatherModelWindspeed] isKindOfClass:[NSNull class]]){
		self.windspeed = dictionary[kWeatherModelWindspeed];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.aqi != nil){
		dictionary[kWeatherModelAqi] = [self.aqi toDictionary];
	}
	if(self.city != nil){
		dictionary[kWeatherModelCity] = self.city;
	}
	if(self.citycode != nil){
		dictionary[kWeatherModelCitycode] = self.citycode;
	}
	if(self.cityid != nil){
		dictionary[kWeatherModelCityid] = self.cityid;
	}
	if(self.daily != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Daily * dailyElement in self.daily){
			[dictionaryElements addObject:[dailyElement toDictionary]];
		}
		dictionary[kWeatherModelDaily] = dictionaryElements;
	}
	if(self.date != nil){
		dictionary[kWeatherModelDate] = self.date;
	}
	if(self.hourly != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Hourly * hourlyElement in self.hourly){
			[dictionaryElements addObject:[hourlyElement toDictionary]];
		}
		dictionary[kWeatherModelHourly] = dictionaryElements;
	}
	if(self.humidity != nil){
		dictionary[kWeatherModelHumidity] = self.humidity;
	}
	if(self.img != nil){
		dictionary[kWeatherModelImg] = self.img;
	}
	if(self.index != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Index * indexElement in self.index){
			[dictionaryElements addObject:[indexElement toDictionary]];
		}
		dictionary[kWeatherModelIndex] = dictionaryElements;
	}
	if(self.pressure != nil){
		dictionary[kWeatherModelPressure] = self.pressure;
	}
	if(self.temp != nil){
		dictionary[kWeatherModelTemp] = self.temp;
	}
	if(self.temphigh != nil){
		dictionary[kWeatherModelTemphigh] = self.temphigh;
	}
	if(self.templow != nil){
		dictionary[kWeatherModelTemplow] = self.templow;
	}
	if(self.updatetime != nil){
		dictionary[kWeatherModelUpdatetime] = self.updatetime;
	}
	if(self.weather != nil){
		dictionary[kWeatherModelWeather] = self.weather;
	}
	if(self.week != nil){
		dictionary[kWeatherModelWeek] = self.week;
	}
	if(self.winddirect != nil){
		dictionary[kWeatherModelWinddirect] = self.winddirect;
	}
	if(self.windpower != nil){
		dictionary[kWeatherModelWindpower] = self.windpower;
	}
	if(self.windspeed != nil){
		dictionary[kWeatherModelWindspeed] = self.windspeed;
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
	if(self.aqi != nil){
		[aCoder encodeObject:self.aqi forKey:kWeatherModelAqi];
	}
	if(self.city != nil){
		[aCoder encodeObject:self.city forKey:kWeatherModelCity];
	}
	if(self.citycode != nil){
		[aCoder encodeObject:self.citycode forKey:kWeatherModelCitycode];
	}
	if(self.cityid != nil){
		[aCoder encodeObject:self.cityid forKey:kWeatherModelCityid];
	}
	if(self.daily != nil){
		[aCoder encodeObject:self.daily forKey:kWeatherModelDaily];
	}
	if(self.date != nil){
		[aCoder encodeObject:self.date forKey:kWeatherModelDate];
	}
	if(self.hourly != nil){
		[aCoder encodeObject:self.hourly forKey:kWeatherModelHourly];
	}
	if(self.humidity != nil){
		[aCoder encodeObject:self.humidity forKey:kWeatherModelHumidity];
	}
	if(self.img != nil){
		[aCoder encodeObject:self.img forKey:kWeatherModelImg];
	}
	if(self.index != nil){
		[aCoder encodeObject:self.index forKey:kWeatherModelIndex];
	}
	if(self.pressure != nil){
		[aCoder encodeObject:self.pressure forKey:kWeatherModelPressure];
	}
	if(self.temp != nil){
		[aCoder encodeObject:self.temp forKey:kWeatherModelTemp];
	}
	if(self.temphigh != nil){
		[aCoder encodeObject:self.temphigh forKey:kWeatherModelTemphigh];
	}
	if(self.templow != nil){
		[aCoder encodeObject:self.templow forKey:kWeatherModelTemplow];
	}
	if(self.updatetime != nil){
		[aCoder encodeObject:self.updatetime forKey:kWeatherModelUpdatetime];
	}
	if(self.weather != nil){
		[aCoder encodeObject:self.weather forKey:kWeatherModelWeather];
	}
	if(self.week != nil){
		[aCoder encodeObject:self.week forKey:kWeatherModelWeek];
	}
	if(self.winddirect != nil){
		[aCoder encodeObject:self.winddirect forKey:kWeatherModelWinddirect];
	}
	if(self.windpower != nil){
		[aCoder encodeObject:self.windpower forKey:kWeatherModelWindpower];
	}
	if(self.windspeed != nil){
		[aCoder encodeObject:self.windspeed forKey:kWeatherModelWindspeed];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.aqi = [aDecoder decodeObjectForKey:kWeatherModelAqi];
	self.city = [aDecoder decodeObjectForKey:kWeatherModelCity];
	self.citycode = [aDecoder decodeObjectForKey:kWeatherModelCitycode];
	self.cityid = [aDecoder decodeObjectForKey:kWeatherModelCityid];
	self.daily = [aDecoder decodeObjectForKey:kWeatherModelDaily];
	self.date = [aDecoder decodeObjectForKey:kWeatherModelDate];
	self.hourly = [aDecoder decodeObjectForKey:kWeatherModelHourly];
	self.humidity = [aDecoder decodeObjectForKey:kWeatherModelHumidity];
	self.img = [aDecoder decodeObjectForKey:kWeatherModelImg];
	self.index = [aDecoder decodeObjectForKey:kWeatherModelIndex];
	self.pressure = [aDecoder decodeObjectForKey:kWeatherModelPressure];
	self.temp = [aDecoder decodeObjectForKey:kWeatherModelTemp];
	self.temphigh = [aDecoder decodeObjectForKey:kWeatherModelTemphigh];
	self.templow = [aDecoder decodeObjectForKey:kWeatherModelTemplow];
	self.updatetime = [aDecoder decodeObjectForKey:kWeatherModelUpdatetime];
	self.weather = [aDecoder decodeObjectForKey:kWeatherModelWeather];
	self.week = [aDecoder decodeObjectForKey:kWeatherModelWeek];
	self.winddirect = [aDecoder decodeObjectForKey:kWeatherModelWinddirect];
	self.windpower = [aDecoder decodeObjectForKey:kWeatherModelWindpower];
	self.windspeed = [aDecoder decodeObjectForKey:kWeatherModelWindspeed];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	WeatherModel *copy = [WeatherModel new];

	copy.aqi = [self.aqi copy];
	copy.city = [self.city copy];
	copy.citycode = [self.citycode copy];
	copy.cityid = [self.cityid copy];
	copy.daily = [self.daily copy];
	copy.date = [self.date copy];
	copy.hourly = [self.hourly copy];
	copy.humidity = [self.humidity copy];
	copy.img = [self.img copy];
	copy.index = [self.index copy];
	copy.pressure = [self.pressure copy];
	copy.temp = [self.temp copy];
	copy.temphigh = [self.temphigh copy];
	copy.templow = [self.templow copy];
	copy.updatetime = [self.updatetime copy];
	copy.weather = [self.weather copy];
	copy.week = [self.week copy];
	copy.winddirect = [self.winddirect copy];
	copy.windpower = [self.windpower copy];
	copy.windspeed = [self.windspeed copy];

	return copy;
}
@end