//
//  Constant.h
//  micro-love-ios
//
//  Created by Alion on 17/3/3.
//  Copyright © 2017年 Alion. All rights reserved.
//

#import "NSObject+Util.h"

@implementation NSObject (Util)
- (BOOL)isNotNull {
    if (self == nil) {
        return NO;
    }
    
    if ([self isEqual:[NSNull null]]) {
        return NO;
    }
    
    if (!self) {
        return NO;
    }
    
    return YES;
}
@end
