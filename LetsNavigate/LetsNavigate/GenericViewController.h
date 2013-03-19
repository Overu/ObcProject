//
//  GenericViewController.h
//  LetsNavigate
//
//  Created by zheng libao on 13-3-18.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountingNavigationController.h"

@interface GenericViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *pushCount;
- (IBAction)incrementCount:(id)sender;

@end
