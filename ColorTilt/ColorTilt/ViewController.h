//
//  ViewController.h
//  ColorTilt
//
//  Created by zheng libao on 13-3-28.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISwitch *toggleAccelermeter;
@property (strong, nonatomic) IBOutlet UISwitch *toggleGyroscope;
@property (strong, nonatomic) IBOutlet UIView *colorView;
@property (strong, nonatomic) CMMotionManager *motionManager;

- (IBAction)controlHardware:(id)sender;
- (void) doAcceleration: (CMAcceleration) acceleration;
- (void) doRotation: (CMRotationRate) rotation;

@end
