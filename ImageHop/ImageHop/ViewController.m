//
//  ViewController.m
//  ImageHop
//
//  Created by zheng libao on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize bunnyView1;
@synthesize bunnyView2;
@synthesize bunnyView3;
@synthesize bunnyView4;
@synthesize bunnyView5;
@synthesize speedSlider;
@synthesize speedStepper;
@synthesize hopsPerSecond;
@synthesize toggleButton;

- (void)viewDidLoad
{
    NSArray *hopAnimation;
    hopAnimation = [[NSArray alloc] initWithObjects: 
                    [UIImage imageNamed: @"frame-1.png"], 
                    [UIImage imageNamed: @"frame-2.png"],
                    [UIImage imageNamed: @"frame-3.png"],
                    [UIImage imageNamed: @"frame-4.png"],
                    [UIImage imageNamed: @"frame-5.png"],
                    [UIImage imageNamed: @"frame-6.png"],
                    [UIImage imageNamed: @"frame-7.png"],
                    [UIImage imageNamed: @"frame-8.png"],
                    [UIImage imageNamed: @"frame-9.png"],
                    [UIImage imageNamed: @"frame-10.png"],
                    [UIImage imageNamed: @"frame-11.png"],
                    [UIImage imageNamed: @"frame-12.png"],
                    [UIImage imageNamed: @"frame-13.png"],
                    [UIImage imageNamed: @"frame-14.png"],
                    [UIImage imageNamed: @"frame-15.png"],
                    [UIImage imageNamed: @"frame-16.png"],
                    [UIImage imageNamed: @"frame-17.png"],
                    [UIImage imageNamed: @"frame-18.png"],
                    [UIImage imageNamed: @"frame-19.png"],
                    [UIImage imageNamed: @"frame-20.png"],
                    nil];
    self.bunnyView1.animationImages = hopAnimation;
    self.bunnyView2.animationImages = hopAnimation;
    self.bunnyView3.animationImages = hopAnimation;
    self.bunnyView4.animationImages = hopAnimation;
    self.bunnyView5.animationImages = hopAnimation;
    
    self.bunnyView1.animationDuration = 1;
    self.bunnyView2.animationDuration = 1;
    self.bunnyView3.animationDuration = 1;
    self.bunnyView4.animationDuration = 1;
    self.bunnyView5.animationDuration = 1;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBunnyView1:nil];
    [self setBunnyView2:nil];
    [self setBunnyView3:nil];
    [self setBunnyView4:nil];
    [self setBunnyView5:nil];
    [self setSpeedSlider:nil];
    [self setSpeedStepper:nil];
    [self setHopsPerSecond:nil];
    [self setToggleButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)toggleAnimation:(id)sender {
    if (self.bunnyView1.isAnimating) {
        [self.bunnyView1 stopAnimating];
        [self.bunnyView2 stopAnimating];
        [self.bunnyView3 stopAnimating];
        [self.bunnyView4 stopAnimating];
        [self.bunnyView5 stopAnimating];
        [self.toggleButton setTitle: @"Hop!" forState: UIControlStateNormal];
    } else {
        [self.bunnyView1 startAnimating];
        [self.bunnyView2 startAnimating];
        [self.bunnyView3 startAnimating];
        [self.bunnyView4 startAnimating];
        [self.bunnyView5 startAnimating];
        [self.toggleButton setTitle: @"Sit Still!" forState: UIControlStateNormal];
    }
}

- (IBAction)setSeed:(id)sender {
    NSString *hopRateString;
    
    self.bunnyView1.animationDuration = 2 - self.speedSlider.value;
    self.bunnyView2.animationDuration = self.bunnyView1.animationDuration + ((float) (rand() % 11 + 1) / 10);
    self.bunnyView3.animationDuration = self.bunnyView1.animationDuration + ((float) (rand() % 11 + 1) / 10);
    self.bunnyView4.animationDuration = self.bunnyView1.animationDuration + ((float) (rand() % 11 + 1) / 10);
    self.bunnyView5.animationDuration = self.bunnyView1.animationDuration + ((float) (rand() % 11 + 1) / 10);
    
    [self.bunnyView1 startAnimating];
    [self.bunnyView2 startAnimating];
    [self.bunnyView3 startAnimating];
    [self.bunnyView4 startAnimating];
    [self.bunnyView5 startAnimating];
    
    [self.toggleButton setTitle: @"Sit Still!" forState: UIControlStateNormal];
    
    hopRateString = [[NSString alloc] initWithFormat: @"%1.2f hps", 1 / (2 - self.speedSlider.value) ];
    self.hopsPerSecond.text = hopRateString;
    self.speedStepper.value = self.speedSlider.value;
}

- (IBAction)setIncrement:(id)sender {
    self.speedSlider.value = self.speedStepper.value;
    [self setSeed: nil];
}
@end
