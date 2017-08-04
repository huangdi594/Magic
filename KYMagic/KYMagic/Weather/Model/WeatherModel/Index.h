#import <UIKit/UIKit.h>

@interface Index : NSObject

@property (nonatomic, strong) NSString * detail;
@property (nonatomic, strong) NSString * iname;
@property (nonatomic, strong) NSString * index;
@property (nonatomic, strong) NSString * ivalue;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
