//
//  Calculator.m
//  iphone_2
//
//  Created by zheng libao on 13-3-5.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize operand1, operand2, accumulator;

- (id) init
{
    if (self = [super init]) {
        operand1 = [[Fraction alloc] init];
        operand2 = [[Fraction alloc] init];
        accumulator = [[Fraction alloc] init];
    }
    
    return self;
}

- (void) clear
{
    accumulator.numerator = 0;
    accumulator.denominator = 0;
}

- (Fraction *) performOperation: (char) op
{
    Fraction *result;
    
    switch (op) {
        case '+':
            result = [operand1 add: operand2];
            break;
        case '-':
            result = [operand1 subtract: operand2];
            break;
        case '*':
            result = [operand1 multiply: operand2];
            break;
        case '/':
            result = [operand1 divide: operand2];
            break;
            
        default:
            break;
    }
    
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
    
    return accumulator;
}

@end
