//
//  ViewController.h
//  Datacalc
//
//  Created by zheng libao on 13-3-16.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataChooserViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) Boolean dateChooserVisible;

- (IBAction)showDateChooser:(id)sender;

- (void) calculateDateDifference: (NSDate *) chosenDate;

@end
