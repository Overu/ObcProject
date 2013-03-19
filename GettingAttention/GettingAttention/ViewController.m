//
//  ViewController.m
//  GettingAttention
//
//  Created by zheng libao on 13-3-13.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize userOutput;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setUserOutput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)doAlert:(id)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle: @"Alert Button Selected" message: @"I need your attention NOW!" delegate: nil cancelButtonTitle: @"ok" otherButtonTitles: nil];
    
    [alertDialog show];
}

- (IBAction)doMultiButtonAlert:(id)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle: @"Alert Button Selected" message: @"I need your attention NOW!" delegate: self cancelButtonTitle: @"ok" otherButtonTitles: @"Maybe", @"Nerver", nil];
    
    [alertDialog show];
}

- (IBAction)doAlertInput:(id)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle: @"Email Adress" message: @"Please enter your email adress" delegate: self cancelButtonTitle: @"ok" otherButtonTitles: nil];
    
    alertDialog.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertDialog show];
}

- (IBAction)doActionSheet:(id)sender {
    UIActionSheet *actionSheet;
    actionSheet = [[UIActionSheet alloc] initWithTitle: @"Available Actions" delegate: self cancelButtonTitle: @"Cancel" destructiveButtonTitle: @"Destory" otherButtonTitles: @"Negotiate", @"Compromise", nil];
    
    [actionSheet showFromRect: [(UIButton *) sender frame] inView: self.view animated:YES];
}

- (IBAction)doSound:(id)sender {
    SystemSoundID soundID;
    
    NSString *soundFile = [[NSBundle mainBundle] pathForResource: @"abc" ofType: @"wav"];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath: soundFile], &soundID);
    
    AudioServicesPlaySystemSound(soundID);
}

- (IBAction)doAlertSound:(id)sender {
    SystemSoundID soundID;
    
    NSString *soundFile = [[NSBundle mainBundle] pathForResource: @"abc" ofType: @"wav"];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath: soundFile], &soundID);
    
    AudioServicesPlayAlertSound(soundID);
}

- (IBAction)doVibration:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)alertView: (UIAlertView *) alertView
    clickedButtonAtIndex: (NSInteger) buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString: @"Maybe"]) {
        self.userOutput.text = buttonTitle;
    } else if ([buttonTitle isEqualToString: @"Nerver"]) {
        self.userOutput.text = buttonTitle;
    } else {
        self.userOutput.text = @"ok!";
    }
    
    if ([alertView.title isEqualToString: @"Email Adress"]) {
        self.userOutput.text = [[alertView textFieldAtIndex: 0] text];
    }
}

- (void)actionSheet: (UIActionSheet *) actionSheet clickedButtonAtIndex: (NSInteger) buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex: buttonIndex];
    if ([buttonTitle isEqualToString: @"Destory"]) {
        self.userOutput.text = buttonTitle;
    } else if ([buttonTitle isEqualToString: @"Negotiate"]) {
        self.userOutput.text = buttonTitle;
    } else if ([buttonTitle isEqualToString: @"Compromise"]) {
        self.userOutput.text = buttonTitle;
    } else {
        self.userOutput.text = @"Cancel";
    }
}

@end
