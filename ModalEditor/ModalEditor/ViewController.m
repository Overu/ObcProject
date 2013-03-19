//
//  ViewController.m
//  ModalEditor
//
//  Created by zheng libao on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize emailLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setEmailLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)handMove:(id)sender {
    [self performSegueWithIdentifier: @"toEditor" sender: self];
}

- (IBAction)toHand:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName: @"MainStoryboard" bundle: nil];
    
    HandViewController *handViewController = [mainStoryboard instantiateViewControllerWithIdentifier: @"Hand"];
    handViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    handViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController: handViewController animated: YES completion: nil];
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender:(id)sender 
{
    
}

@end
