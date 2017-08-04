#import <UIKit/UIKit.h>
#import "Aqiinfo.h"

@interface Aqi : NSObject

@property (nonatomic, strong) NSString * aqi;
@property (nonatomic, strong) Aqiinfo * aqiinfo;
@property (nonatomic, strong) NSString * co;
@property (nonatomic, strong) NSString * co24;
@property (nonatomic, strong) NSString * ico;
@property (nonatomic, strong) NSString * ino2;
@property (nonatomic, strong) NSString * io3;
@property (nonatomic, strong) NSString * io38;
@property (nonatomic, strong) NSString * ipm10;
@property (nonatomic, strong) NSString * ipm25;
@property (nonatomic, strong) NSString * iso2;
@property (nonatomic, strong) NSString * no2;
@property (nonatomic, strong) NSString * no224;
@property (nonatomic, strong) NSString * o3;
@property (nonatomic, strong) NSString * o324;
@property (nonatomic, strong) NSString * o38;
@property (nonatomic, strong) NSString * pm10;
@property (nonatomic, strong) NSString * pm1024;
@property (nonatomic, strong) NSString * pm25;
@property (nonatomic, strong) NSString * pm2524;
@property (nonatomic, strong) NSString * primarypollutant;
@property (nonatomic, strong) NSString * quality;
@property (nonatomic, strong) NSString * so2;
@property (nonatomic, strong) NSString * so224;
@property (nonatomic, strong) NSString * timepoint;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end