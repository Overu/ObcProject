//
//  ViewController.m
//  ColorTilt
//
//  Created by zheng libao on 13-3-28.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize toggleAccelermeter;
@synthesize toggleGyroscope;
@synthesize colorView;
@synthesize motionManager;

- (void)viewDidLoad
{
    self. motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .01;
    self.motionManager.gyroUpdateInterval = .01;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setToggleAccelermeter:nil];
    [self setToggleGyroscope:nil];
    [self setColorView:nil];
    [self setMotionManager: nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

- (void)doAcceleration:(CMAcceleration)acceleration
{
    if (acceleration.x > 1.3) {
        self.colorView.backgroundColor = [UIColor greenColor];
    } else if (acceleration.x < -1.3) {
        self.colorView.backgroundColor = [UIColor orangeColor];
    } else if (acceleration.y > 1.3) {
        self.colorView.backgroundColor = [UIColor redColor];
    } else if (acceleration.y < -1.3) {
        self.colorView.backgroundColor = [UIColor blueColor];
    } else if (acceleration.z > 1.3) {
        self.colorView.backgroundColor = [UIColor yellowColor];
    } else if (acceleration.z < -1.3) {
        self.colorView.backgroundColor = [UIColor purpleColor];
    }
    
    double value = fabs(acceleration.x);
    if (value > 1.0) {
        value = 1.0;
    }
    self.colorView.alpha = value;
}

- (void)doRotation:(CMRotationRate)rotation
{
    double value = (fabs(rotation.x) + fabs(rotation.y) + fabs(rotation.z)) / 8.0;
    if (value > 1.0) {
        value = 1.0;
    }
    self.colorView.alpha = value;
}

- (IBAction)controlHardware:(id)sender {
    if([self.toggleAccelermeter isOn]) {
        [self.motionManager startAccelerometerUpdatesToQueue: [NSOperationQueue currentQueue] withHandler: ^(CMAccelerometerData *accelData, NSError *error) {
            [self doAcceleration: accelData.acceleration];
        }];
    } else {
        [self.motionManager stopAccelerometerUpdates];
    }
    
    if ([self.toggleGyroscope isOn] && self.motionManager.gyroAvailable) {
        [self.motionManager startGyroUpdatesToQueue: [NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
            [self doRotation: gyroData.rotationRate];
        }];
    } else {
        [self.motionManager stopGyroUpdates];
        [self.toggleGyroscope setOn:NO animated: YES];
    }
}
@end
