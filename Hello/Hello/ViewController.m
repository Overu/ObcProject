//
//  ViewController.m
//  Hello
//
//  Created by zheng libao on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize thePlace;
@synthesize theVerb;
@synthesize theNumber;
@synthesize theTemplate;
@synthesize theStory;
@synthesize theButton;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setThePlace:nil];
    [self setTheVerb:nil];
    [self setTheNumber:nil];
    [self setTheTemplate:nil];
    [self setTheStory:nil];
    [self setTheButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (IBAction)createStory:(id)sender {
    self.theStory.text = [self.theTemplate.text stringByReplacingOccurrencesOfString: @"<place>" withString: self.thePlace.text];
    self.theStory.text = [self.theStory.text stringByReplacingOccurrencesOfString: @"<verb>" withString: self.theVerb.text];
    self.theStory.text = [self.theStory.text stringByReplacingOccurrencesOfString: @"<number>" withString: self.theNumber.text];
}

- (IBAction)hideKeyBoard:(id)sender {
    [self.theVerb resignFirstResponder];
    [self.thePlace resignFirstResponder];
    [self.theNumber resignFirstResponder];
    [self.theTemplate resignFirstResponder];
}
@end
