//
//  Calculator.h
//  iphone_2
//
//  Created by zheng libao on 13-3-5.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject

@property(strong, nonatomic) Fraction *operand1, *operand2, *accumulator;

- (Fraction *) performOperation: (char) op;
- (void) clear;

@end
