//
//  ViewController.h
//  iphone_2
//
//  Created by zheng libao on 13-3-5.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface ViewController : UIViewController

@property(strong, nonatomic) IBOutlet UILabel *display;

- (void) processDigit: (int) digit;
- (void) processOp: (char) theOp;
- (void) storeFracPart;

- (IBAction) clickDigit: (UIButton *) sender;

- (IBAction) clickPlus;
- (IBAction) clickMinus;
- (IBAction) clickMultiply;
- (IBAction) clickDivide;

- (IBAction) clickOver;
- (IBAction) clickEquals;
- (IBAction) clickClear;

@end
