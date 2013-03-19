//
//  ViewController.m
//  iphone_2
//
//  Created by zheng libao on 13-3-5.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumberator;
    NSMutableString *displayString;
    Calculator *myCalculator;
}

@synthesize display;

- (void)viewDidLoad
{
    firstOperand = YES;
    isNumberator = YES;
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[Calculator alloc] init];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) processDigit: (int) digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString: [NSString stringWithFormat: @"%i", digit]];
    display.text = displayString;
}

- (void) clickDigit: (UIButton *) sender
{
    int digit = sender.tag;
    
    [self processDigit: digit];
}

- (void) processOp: (char) theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumberator = YES;

    [displayString appendString: opStr];
    display.text = displayString;
}

- (void) storeFracPart
{
    if (firstOperand) {
        if (isNumberator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        } else {
            myCalculator.operand1.denominator = currentNumber;
        }
    } else if (isNumberator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    } else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    currentNumber = 0;
}

- (void) clickOver
{
    [self storeFracPart];
    isNumberator = NO;
    [displayString appendString: @"/"];
    display.text = displayString;
}

- (void) clickMinus
{
    [self processOp: '-'];
}

- (void) clickMultiply
{
    [self processOp: '*'];
}

- (void) clickDivide
{
    [self processOp: '/'];
}

- (void) clickPlus
{
    [self processOp: '+'];
}

- (void) clickEquals
{
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation: op];
        
        [displayString appendString: @"="];
        [displayString appendString: [myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumberator = YES;
        firstOperand = YES;
        [displayString setString: @""];
    }
}

- (void) clickClear
{
    isNumberator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString: @""];
    display.text = displayString;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
