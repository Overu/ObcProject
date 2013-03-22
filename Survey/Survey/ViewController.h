//
//  ViewController.h
//  Survey
//
//  Created by zheng libao on 13-3-22.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextView *resultsView;

- (IBAction)storeResults:(id)sender;
- (IBAction)showResults:(id)sender;
- (IBAction)hideKeyBoard:(id)sender;
- (IBAction)hideKeyBoard1:(id)sender;
@end
