//
//  ViewController.m
//  Reframe
//
//  Created by zheng libao on 13-3-23.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize viewLabel;
@synthesize buttonOne;
@synthesize buttonTwo;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setViewLabel:nil];
    [self setButtonOne:nil];
    [self setButtonTwo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation: toInterfaceOrientation duration: duration];
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.viewLabel.frame = CGRectMake(175.0, 140.0, 130.0, 20.0);
        self.buttonOne.frame = CGRectMake(20.0, 20.0, 440.0, 100.0);
        self.buttonTwo.frame = CGRectMake(20.0, 180.0, 440.0, 100.0);
    } else {
        self.viewLabel.frame = CGRectMake(95.0, 15.0, 130.0, 20.0);
        self.buttonOne.frame = CGRectMake(20.0, 50.0, 280.0, 190.0);
        self.buttonTwo.frame = CGRectMake(20.0, 250.0, 280.0, 190.0);
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
