//
//  HandViewController.h
//  ModalEditor
//
//  Created by zheng libao on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HandViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *handEmail;

- (IBAction)handDone:(id)sender;

@end
