//
//  ViewController.h
//  ModalEditor
//
//  Created by zheng libao on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HandViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *emailLabel;

- (IBAction)handMove:(id)sender;
- (IBAction)toHand:(id)sender;

@end
