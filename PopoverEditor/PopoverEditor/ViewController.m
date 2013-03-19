//
//  ViewController.m
//  PopoverEditor
//
//  Created by zheng libao on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize emailLabel;
@synthesize popoverController;

- (void)viewDidLoad
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName: @"MainStoryboard" bundle: nil];
    
    CustomViewController *customVC = [mainStoryboard instantiateViewControllerWithIdentifier: @"Custom"];
    
    self.popoverController = [[UIPopoverController alloc] initWithContentViewController:customVC];
    self.popoverController.delegate = self;
    self.popoverController.popoverContentSize = CGSizeMake(300, 400);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setEmailLabel:nil];
    [self setPopoverController: nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    UIStoryboardPopoverSegue *popoverSegue;
    popoverSegue = (UIStoryboardPopoverSegue *)segue;
    
    UIPopoverController *popoverController;
    popoverController = popoverSegue.popoverController;
    popoverController.delegate = self;
    
    EditorViewController *editorVC;
    editorVC = (EditorViewController *)popoverSegue.destinationViewController;
    editorVC.emailField.text = self.emailLabel.text;
}

- (void) popoverControllerDidDismissPopover: (UIPopoverController *) popoverController
{
    NSString *newEmail = [popoverController.contentViewController.title isEqualToString:@"Custom"] ? ((CustomViewController *)popoverController.contentViewController).emailCustom.text : ((EditorViewController *)popoverController.contentViewController).emailField.text;
    self.emailLabel.text = newEmail;
}

- (IBAction)toEditor:(id)sender {
}

- (IBAction)Custom:(id)sender {
    [self.popoverController presentPopoverFromRect: ((UIView *)sender).frame inView:self.view permittedArrowDirections: UIPopoverArrowDirectionAny animated: YES];
    ((CustomViewController *)self.popoverController.contentViewController).emailCustom.text = self.emailLabel.text;
}
@end
