//
//  ViewController.h
//  PopoverEditor
//
//  Created by zheng libao on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditorViewController.h"
#import "CustomViewController.h"

@interface ViewController : UIViewController<UIPopoverControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) UIPopoverController *popoverController;

- (IBAction)toEditor:(id)sender;
- (IBAction)Custom:(id)sender;

@end
