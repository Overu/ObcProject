//
//  ViewController.m
//  Flashlight
//
//  Created by zheng libao on 13-3-22.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"


#define kOnOffToggle @"off"
#define kBrightnessLevel @"brightness"

@interface ViewController ()

@end

@implementation ViewController
@synthesize toggleSwitch;
@synthesize brightnessSlider;
@synthesize lightSource;

- (void)viewDidLoad
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.toggleSwitch.on = [userDefaults boolForKey: kOnOffToggle];
    self.brightnessSlider.value = [userDefaults floatForKey: kBrightnessLevel];
    
    if(self.toggleSwitch.on) {
        self.lightSource.alpha = self.brightnessSlider.value;
    } else {
        self.lightSource.alpha = 0.0;
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setToggleSwitch:nil];
    [self setBrightnessSlider:nil];
    [self setLightSource:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)setLightSourceAlphaValue:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setBool: self.toggleSwitch.on forKey: kOnOffToggle];
    [userDefaults setFloat: self.brightnessSlider.value forKey: kBrightnessLevel];
    
    [userDefaults synchronize];
    
    if(self.toggleSwitch.on) {
        self.lightSource.alpha = self.brightnessSlider.value;
    } else {
        self.lightSource.alpha = 0.0;
    }
}
@end
