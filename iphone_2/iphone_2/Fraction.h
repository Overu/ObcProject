//
//  Fraction.h
//  iphone_2
//
//  Created by zheng libao on 13-3-5.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator, denominator;

- (void) print;
- (void) setTo: (int) n over: (int) d;
- (Fraction *) add: (Fraction *) f;
- (Fraction *) subtract: (Fraction *) f;
- (Fraction *) multiply: (Fraction *) f;
- (Fraction *) divide: (Fraction *) f;
- (void) reduce;
- (double) convertToNum;
- (NSString *) convertToString;

@end
