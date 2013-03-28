//
//  ViewController.m
//  Gestures
//
//  Created by zheng libao on 13-3-28.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define kOriginWidth 125.0
#define kOriginHeight 115.0
#define kOrginX 100.0
#define kOrginY 330.0

@interface ViewController ()

@end

@implementation ViewController
@synthesize outputLabel;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setOutputLabel:nil];
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self becomeFirstResponder];
    [super viewDidAppear: animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        self.outputLabel.text = @"Shaking things up";
        self.imageView.transform = CGAffineTransformMakeRotation(0.0);
        self.imageView.frame = CGRectMake(kOrginX, kOrginY, kOriginWidth, kOriginHeight);
    }
}

- (IBAction)foundTap:(id)sender {
    self.outputLabel.text = @"Tapped";
}

- (IBAction)foundSwipe:(id)sender {
    self.outputLabel.text = @"Swiped";
}

- (IBAction)foundPinch:(id)sender {
    UIPinchGestureRecognizer *recognizer = (UIPinchGestureRecognizer *)sender;
    NSString *feedback;
    double scale;
    
    scale = recognizer.scale;
    self.imageView.transform = CGAffineTransformMakeRotation(0.0);
    feedback = [[NSString alloc] initWithFormat: @"Pinched, Scale: %1.2f, Velocity: %1.2f", recognizer.scale, recognizer.velocity];
    
    self.outputLabel.text = feedback;
    self.imageView.frame = CGRectMake(kOrginX, kOrginY, kOriginWidth*recognizer.scale, kOriginHeight*recognizer.scale);
}

- (IBAction)foundRatation:(id)sender {
    UIRotationGestureRecognizer *recognizer = (UIRotationGestureRecognizer *)sender;
    NSString *feedback;
    double rotation;
    
    rotation = recognizer.rotation;
    feedback = [[NSString alloc] initWithFormat: @"Rotationed, Scale: %1.2f, Velocity: %1.2f", recognizer.rotation, recognizer.velocity];
    self.imageView.transform = CGAffineTransformMakeRotation(rotation);
}
@end
