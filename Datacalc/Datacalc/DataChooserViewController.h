//
//  DataChooserViewController.h
//  Datacalc
//
//  Created by zheng libao on 13-3-16.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DataChooserViewController : UIViewController

@property (strong, nonatomic) id delegate;

- (IBAction)setDateTime:(id)sender;
- (IBAction)dismissDateChooser:(id)sender;

@end
