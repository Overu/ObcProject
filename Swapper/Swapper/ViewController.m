//
//  ViewController.m
//  Swapper
//
//  Created by zheng libao on 13-3-23.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define kDeg2Rad (3.1415926/180.0)

@interface ViewController ()

@end

@implementation ViewController
@synthesize portraitVeiw;
@synthesize landscapeView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setPortraitVeiw:nil];
    [self setLandscapeView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation: toInterfaceOrientation duration: duration];
    
    if(toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.view = self.landscapeView;
        self.view.transform = CGAffineTransformMakeRotation(kDeg2Rad * (90));
        self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
    } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        self.view = self.landscapeView;
        self.view.transform = CGAffineTransformMakeRotation(kDeg2Rad * (-90));
        self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
    } else {
        self.view = self.portraitVeiw;
        self.view.transform = CGAffineTransformMakeRotation(kDeg2Rad * (0));
        self.view.bounds = CGRectMake(0.0, 0.0, 320.0, 420.0);
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
