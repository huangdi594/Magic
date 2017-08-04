#import <UIKit/UIKit.h>

@interface Aqiinfo : NSObject

@property (nonatomic, strong) NSString * affect;
@property (nonatomic, strong) NSString * color;
@property (nonatomic, strong) NSString * level;
@property (nonatomic, strong) NSString * measure;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end