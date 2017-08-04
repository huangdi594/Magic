#import <UIKit/UIKit.h>

@interface Night : NSObject

@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * templow;
@property (nonatomic, strong) NSString * weather;
@property (nonatomic, strong) NSString * winddirect;
@property (nonatomic, strong) NSString * windpower;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end