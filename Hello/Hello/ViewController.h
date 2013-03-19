//
//  ViewController.h
//  Hello
//
//  Created by zheng libao on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *thePlace;
@property (strong, nonatomic) IBOutlet UITextField *theVerb;
@property (strong, nonatomic) IBOutlet UITextField *theNumber;
@property (strong, nonatomic) IBOutlet UITextView *theTemplate;
@property (strong, nonatomic) IBOutlet UITextView *theStory;
@property (strong, nonatomic) IBOutlet UIButton *theButton;

- (IBAction)createStory:(id)sender;

- (IBAction)hideKeyBoard:(id)sender;
@end
