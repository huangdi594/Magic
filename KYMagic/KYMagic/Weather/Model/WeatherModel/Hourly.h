#import <UIKit/UIKit.h>

@interface Hourly : NSObject

@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * temp;
@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) NSString * weather;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end