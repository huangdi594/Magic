#import <UIKit/UIKit.h>
#import "Day.h"
#import "Night.h"

@interface Daily : NSObject

@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) Day * day;
@property (nonatomic, strong) Night * night;
@property (nonatomic, strong) NSString * sunrise;
@property (nonatomic, strong) NSString * sunset;
@property (nonatomic, strong) NSString * week;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end