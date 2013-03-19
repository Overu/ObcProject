//
//  EditorViewController.h
//  ModalEditor
//
//  Created by zheng libao on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface EditorViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)dismissEditor:(id)sender;

@end
