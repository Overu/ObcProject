//
//  ViewController.m
//  Orientation
//
//  Created by zheng libao on 13-3-28.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize orientationLabel;

- (void)viewDidLoad
{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(orientionChanged:) name: @"UIDeviceOrientationDidChangeNotification" object: nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)orientionChanged:(NSNotification *)notification
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    switch (orientation) {
        case UIDeviceOrientationFaceUp:
            self.orientationLabel.text = @"Face up";
            break;
        case UIDeviceOrientationFaceDown:
            self.orientationLabel.text = @"Face down";
            break;
        case UIDeviceOrientationPortrait:
            self.orientationLabel.text = @"Standing up";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            self.orientationLabel.text = @"Upside Down";
            break;
        case UIDeviceOrientationLandscapeLeft:
            self.orientationLabel.text = @"Left Side";
            break;
        case UIDeviceOrientationLandscapeRight:
            self.orientationLabel.text = @"Right Side";
            break;
            
        default:
            self.orientationLabel.text = @"Unknown";
            break;
    }
}

- (void)viewDidUnload
{
    [self setOrientationLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
