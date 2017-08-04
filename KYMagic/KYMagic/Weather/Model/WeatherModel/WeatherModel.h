#import <UIKit/UIKit.h>
#import "Aqi.h"
#import "Daily.h"
#import "Hourly.h"
#import "Index.h"

@interface WeatherModel : NSObject

@property (nonatomic, strong) Aqi * aqi;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * citycode;
@property (nonatomic, strong) NSString * cityid;
@property (nonatomic, strong) NSArray <Daily *>* daily;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSArray <Hourly *>* hourly;
@property (nonatomic, strong) NSString * humidity;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSArray <Index *>* index;
@property (nonatomic, strong) NSString * pressure;
@property (nonatomic, strong) NSString * temp;
@property (nonatomic, strong) NSString * temphigh;
@property (nonatomic, strong) NSString * templow;
@property (nonatomic, strong) NSString * updatetime;
@property (nonatomic, strong) NSString * weather;
@property (nonatomic, strong) NSString * week;
@property (nonatomic, strong) NSString * winddirect;
@property (nonatomic, strong) NSString * windpower;
@property (nonatomic, strong) NSString * windspeed;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
