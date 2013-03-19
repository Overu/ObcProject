//
//  ViewController.h
//  GettingAttention
//
//  Created by zheng libao on 13-3-13.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController<UIAlertViewDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UILabel *userOutput;

- (IBAction)doAlert:(id)sender;
- (IBAction)doMultiButtonAlert:(id)sender;
- (IBAction)doAlertInput:(id)sender;
- (IBAction)doActionSheet:(id)sender;
- (IBAction)doSound:(id)sender;
- (IBAction)doAlertSound:(id)sender;
- (IBAction)doVibration:(id)sender;

@end
