#import <UIKit/UIKit.h>

@interface Day : NSObject

@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * temphigh;
@property (nonatomic, strong) NSString * weather;
@property (nonatomic, strong) NSString * winddirect;
@property (nonatomic, strong) NSString * windpower;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end