//
//	Aqi.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Aqi.h"

NSString *const kAqiAqi = @"aqi";
NSString *const kAqiAqiinfo = @"aqiinfo";
NSString *const kAqiCo = @"co";
NSString *const kAqiCo24 = @"co24";
NSString *const kAqiIco = @"ico";
NSString *const kAqiIno2 = @"ino2";
NSString *const kAqiIo3 = @"io3";
NSString *const kAqiIo38 = @"io38";
NSString *const kAqiIpm10 = @"ipm10";
NSString *const kAqiIpm25 = @"ipm2_5";
NSString *const kAqiIso2 = @"iso2";
NSString *const kAqiNo2 = @"no2";
NSString *const kAqiNo224 = @"no224";
NSString *const kAqiO3 = @"o3";
NSString *const kAqiO324 = @"o324";
NSString *const kAqiO38 = @"o38";
NSString *const kAqiPm10 = @"pm10";
NSString *const kAqiPm1024 = @"pm1024";
NSString *const kAqiPm25 = @"pm2_5";
NSString *const kAqiPm2524 = @"pm2_524";
NSString *const kAqiPrimarypollutant = @"primarypollutant";
NSString *const kAqiQuality = @"quality";
NSString *const kAqiSo2 = @"so2";
NSString *const kAqiSo224 = @"so224";
NSString *const kAqiTimepoint = @"timepoint";

@interface Aqi ()
@end
@implementation Aqi




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAqiAqi] isKindOfClass:[NSNull class]]){
		self.aqi = dictionary[kAqiAqi];
	}	
	if(![dictionary[kAqiAqiinfo] isKindOfClass:[NSNull class]]){
		self.aqiinfo = [[Aqiinfo alloc] initWithDictionary:dictionary[kAqiAqiinfo]];
	}

	if(![dictionary[kAqiCo] isKindOfClass:[NSNull class]]){
		self.co = dictionary[kAqiCo];
	}	
	if(![dictionary[kAqiCo24] isKindOfClass:[NSNull class]]){
		self.co24 = dictionary[kAqiCo24];
	}	
	if(![dictionary[kAqiIco] isKindOfClass:[NSNull class]]){
		self.ico = dictionary[kAqiIco];
	}	
	if(![dictionary[kAqiIno2] isKindOfClass:[NSNull class]]){
		self.ino2 = dictionary[kAqiIno2];
	}	
	if(![dictionary[kAqiIo3] isKindOfClass:[NSNull class]]){
		self.io3 = dictionary[kAqiIo3];
	}	
	if(![dictionary[kAqiIo38] isKindOfClass:[NSNull class]]){
		self.io38 = dictionary[kAqiIo38];
	}	
	if(![dictionary[kAqiIpm10] isKindOfClass:[NSNull class]]){
		self.ipm10 = dictionary[kAqiIpm10];
	}	
	if(![dictionary[kAqiIpm25] isKindOfClass:[NSNull class]]){
		self.ipm25 = dictionary[kAqiIpm25];
	}	
	if(![dictionary[kAqiIso2] isKindOfClass:[NSNull class]]){
		self.iso2 = dictionary[kAqiIso2];
	}	
	if(![dictionary[kAqiNo2] isKindOfClass:[NSNull class]]){
		self.no2 = dictionary[kAqiNo2];
	}	
	if(![dictionary[kAqiNo224] isKindOfClass:[NSNull class]]){
		self.no224 = dictionary[kAqiNo224];
	}	
	if(![dictionary[kAqiO3] isKindOfClass:[NSNull class]]){
		self.o3 = dictionary[kAqiO3];
	}	
	if(![dictionary[kAqiO324] isKindOfClass:[NSNull class]]){
		self.o324 = dictionary[kAqiO324];
	}	
	if(![dictionary[kAqiO38] isKindOfClass:[NSNull class]]){
		self.o38 = dictionary[kAqiO38];
	}	
	if(![dictionary[kAqiPm10] isKindOfClass:[NSNull class]]){
		self.pm10 = dictionary[kAqiPm10];
	}	
	if(![dictionary[kAqiPm1024] isKindOfClass:[NSNull class]]){
		self.pm1024 = dictionary[kAqiPm1024];
	}	
	if(![dictionary[kAqiPm25] isKindOfClass:[NSNull class]]){
		self.pm25 = dictionary[kAqiPm25];
	}	
	if(![dictionary[kAqiPm2524] isKindOfClass:[NSNull class]]){
		self.pm2524 = dictionary[kAqiPm2524];
	}	
	if(![dictionary[kAqiPrimarypollutant] isKindOfClass:[NSNull class]]){
		self.primarypollutant = dictionary[kAqiPrimarypollutant];
	}	
	if(![dictionary[kAqiQuality] isKindOfClass:[NSNull class]]){
		self.quality = dictionary[kAqiQuality];
	}	
	if(![dictionary[kAqiSo2] isKindOfClass:[NSNull class]]){
		self.so2 = dictionary[kAqiSo2];
	}	
	if(![dictionary[kAqiSo224] isKindOfClass:[NSNull class]]){
		self.so224 = dictionary[kAqiSo224];
	}	
	if(![dictionary[kAqiTimepoint] isKindOfClass:[NSNull class]]){
		self.timepoint = dictionary[kAqiTimepoint];
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
		dictionary[kAqiAqi] = self.aqi;
	}
	if(self.aqiinfo != nil){
		dictionary[kAqiAqiinfo] = [self.aqiinfo toDictionary];
	}
	if(self.co != nil){
		dictionary[kAqiCo] = self.co;
	}
	if(self.co24 != nil){
		dictionary[kAqiCo24] = self.co24;
	}
	if(self.ico != nil){
		dictionary[kAqiIco] = self.ico;
	}
	if(self.ino2 != nil){
		dictionary[kAqiIno2] = self.ino2;
	}
	if(self.io3 != nil){
		dictionary[kAqiIo3] = self.io3;
	}
	if(self.io38 != nil){
		dictionary[kAqiIo38] = self.io38;
	}
	if(self.ipm10 != nil){
		dictionary[kAqiIpm10] = self.ipm10;
	}
	if(self.ipm25 != nil){
		dictionary[kAqiIpm25] = self.ipm25;
	}
	if(self.iso2 != nil){
		dictionary[kAqiIso2] = self.iso2;
	}
	if(self.no2 != nil){
		dictionary[kAqiNo2] = self.no2;
	}
	if(self.no224 != nil){
		dictionary[kAqiNo224] = self.no224;
	}
	if(self.o3 != nil){
		dictionary[kAqiO3] = self.o3;
	}
	if(self.o324 != nil){
		dictionary[kAqiO324] = self.o324;
	}
	if(self.o38 != nil){
		dictionary[kAqiO38] = self.o38;
	}
	if(self.pm10 != nil){
		dictionary[kAqiPm10] = self.pm10;
	}
	if(self.pm1024 != nil){
		dictionary[kAqiPm1024] = self.pm1024;
	}
	if(self.pm25 != nil){
		dictionary[kAqiPm25] = self.pm25;
	}
	if(self.pm2524 != nil){
		dictionary[kAqiPm2524] = self.pm2524;
	}
	if(self.primarypollutant != nil){
		dictionary[kAqiPrimarypollutant] = self.primarypollutant;
	}
	if(self.quality != nil){
		dictionary[kAqiQuality] = self.quality;
	}
	if(self.so2 != nil){
		dictionary[kAqiSo2] = self.so2;
	}
	if(self.so224 != nil){
		dictionary[kAqiSo224] = self.so224;
	}
	if(self.timepoint != nil){
		dictionary[kAqiTimepoint] = self.timepoint;
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
		[aCoder encodeObject:self.aqi forKey:kAqiAqi];
	}
	if(self.aqiinfo != nil){
		[aCoder encodeObject:self.aqiinfo forKey:kAqiAqiinfo];
	}
	if(self.co != nil){
		[aCoder encodeObject:self.co forKey:kAqiCo];
	}
	if(self.co24 != nil){
		[aCoder encodeObject:self.co24 forKey:kAqiCo24];
	}
	if(self.ico != nil){
		[aCoder encodeObject:self.ico forKey:kAqiIco];
	}
	if(self.ino2 != nil){
		[aCoder encodeObject:self.ino2 forKey:kAqiIno2];
	}
	if(self.io3 != nil){
		[aCoder encodeObject:self.io3 forKey:kAqiIo3];
	}
	if(self.io38 != nil){
		[aCoder encodeObject:self.io38 forKey:kAqiIo38];
	}
	if(self.ipm10 != nil){
		[aCoder encodeObject:self.ipm10 forKey:kAqiIpm10];
	}
	if(self.ipm25 != nil){
		[aCoder encodeObject:self.ipm25 forKey:kAqiIpm25];
	}
	if(self.iso2 != nil){
		[aCoder encodeObject:self.iso2 forKey:kAqiIso2];
	}
	if(self.no2 != nil){
		[aCoder encodeObject:self.no2 forKey:kAqiNo2];
	}
	if(self.no224 != nil){
		[aCoder encodeObject:self.no224 forKey:kAqiNo224];
	}
	if(self.o3 != nil){
		[aCoder encodeObject:self.o3 forKey:kAqiO3];
	}
	if(self.o324 != nil){
		[aCoder encodeObject:self.o324 forKey:kAqiO324];
	}
	if(self.o38 != nil){
		[aCoder encodeObject:self.o38 forKey:kAqiO38];
	}
	if(self.pm10 != nil){
		[aCoder encodeObject:self.pm10 forKey:kAqiPm10];
	}
	if(self.pm1024 != nil){
		[aCoder encodeObject:self.pm1024 forKey:kAqiPm1024];
	}
	if(self.pm25 != nil){
		[aCoder encodeObject:self.pm25 forKey:kAqiPm25];
	}
	if(self.pm2524 != nil){
		[aCoder encodeObject:self.pm2524 forKey:kAqiPm2524];
	}
	if(self.primarypollutant != nil){
		[aCoder encodeObject:self.primarypollutant forKey:kAqiPrimarypollutant];
	}
	if(self.quality != nil){
		[aCoder encodeObject:self.quality forKey:kAqiQuality];
	}
	if(self.so2 != nil){
		[aCoder encodeObject:self.so2 forKey:kAqiSo2];
	}
	if(self.so224 != nil){
		[aCoder encodeObject:self.so224 forKey:kAqiSo224];
	}
	if(self.timepoint != nil){
		[aCoder encodeObject:self.timepoint forKey:kAqiTimepoint];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.aqi = [aDecoder decodeObjectForKey:kAqiAqi];
	self.aqiinfo = [aDecoder decodeObjectForKey:kAqiAqiinfo];
	self.co = [aDecoder decodeObjectForKey:kAqiCo];
	self.co24 = [aDecoder decodeObjectForKey:kAqiCo24];
	self.ico = [aDecoder decodeObjectForKey:kAqiIco];
	self.ino2 = [aDecoder decodeObjectForKey:kAqiIno2];
	self.io3 = [aDecoder decodeObjectForKey:kAqiIo3];
	self.io38 = [aDecoder decodeObjectForKey:kAqiIo38];
	self.ipm10 = [aDecoder decodeObjectForKey:kAqiIpm10];
	self.ipm25 = [aDecoder decodeObjectForKey:kAqiIpm25];
	self.iso2 = [aDecoder decodeObjectForKey:kAqiIso2];
	self.no2 = [aDecoder decodeObjectForKey:kAqiNo2];
	self.no224 = [aDecoder decodeObjectForKey:kAqiNo224];
	self.o3 = [aDecoder decodeObjectForKey:kAqiO3];
	self.o324 = [aDecoder decodeObjectForKey:kAqiO324];
	self.o38 = [aDecoder decodeObjectForKey:kAqiO38];
	self.pm10 = [aDecoder decodeObjectForKey:kAqiPm10];
	self.pm1024 = [aDecoder decodeObjectForKey:kAqiPm1024];
	self.pm25 = [aDecoder decodeObjectForKey:kAqiPm25];
	self.pm2524 = [aDecoder decodeObjectForKey:kAqiPm2524];
	self.primarypollutant = [aDecoder decodeObjectForKey:kAqiPrimarypollutant];
	self.quality = [aDecoder decodeObjectForKey:kAqiQuality];
	self.so2 = [aDecoder decodeObjectForKey:kAqiSo2];
	self.so224 = [aDecoder decodeObjectForKey:kAqiSo224];
	self.timepoint = [aDecoder decodeObjectForKey:kAqiTimepoint];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Aqi *copy = [Aqi new];

	copy.aqi = [self.aqi copy];
	copy.aqiinfo = [self.aqiinfo copy];
	copy.co = [self.co copy];
	copy.co24 = [self.co24 copy];
	copy.ico = [self.ico copy];
	copy.ino2 = [self.ino2 copy];
	copy.io3 = [self.io3 copy];
	copy.io38 = [self.io38 copy];
	copy.ipm10 = [self.ipm10 copy];
	copy.ipm25 = [self.ipm25 copy];
	copy.iso2 = [self.iso2 copy];
	copy.no2 = [self.no2 copy];
	copy.no224 = [self.no224 copy];
	copy.o3 = [self.o3 copy];
	copy.o324 = [self.o324 copy];
	copy.o38 = [self.o38 copy];
	copy.pm10 = [self.pm10 copy];
	copy.pm1024 = [self.pm1024 copy];
	copy.pm25 = [self.pm25 copy];
	copy.pm2524 = [self.pm2524 copy];
	copy.primarypollutant = [self.primarypollutant copy];
	copy.quality = [self.quality copy];
	copy.so2 = [self.so2 copy];
	copy.so224 = [self.so224 copy];
	copy.timepoint = [self.timepoint copy];

	return copy;
}
@end