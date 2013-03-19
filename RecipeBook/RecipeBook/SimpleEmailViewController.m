//
//  SimpleEmailViewController.m
//  RecipeBook
//
//  Created by zheng libao on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SimpleEmailViewController.h"

@interface SimpleEmailViewController ()

@end

@implementation SimpleEmailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) showEmail: (id) sender
{
    NSString *emailTitle = @"Test Email";
    NSString *meeageBody = @"<h1>SB</h1>";
    NSArray *toRecipents = [NSArray arrayWithObject: @"fengjian@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject: emailTitle];
    [mc setMessageBody: meeageBody isHTML: YES];
    [mc setToRecipients: toRecipents];
    
    [self presentViewController: mc animated: YES completion: NULL];
}

- (void)mailComposeController: (MFMailComposeViewController *)controller 
          didFinishWithResult: (MFMailComposeResult) result 
                        error: (NSError *) error
{
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail Cancelled!");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail Saved!");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failed %@!", [error localizedDescription]);
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail Sent!");
            break;
            
        default:
            break;
    }
    [self dismissViewControllerAnimated: YES completion: NULL];
}

@end
