//
//  GenericViewController.h
//  LetsTab
//
//  Created by zheng libao on 13-3-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountingViewController.h"

@interface GenericViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (strong, nonatomic) IBOutlet UITabBarItem *barItem;

- (IBAction)incrementCountFirst:(id)sender;
- (IBAction)incrementCountSecond:(id)sender;
- (IBAction)incrementCountThird:(id)sender;
- (void) updateBadge;
- (void) updateCounts;

@end
