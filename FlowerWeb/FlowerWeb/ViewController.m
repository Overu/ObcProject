//
//  ViewController.m
//  FlowerWeb
//
//  Created by zheng libao on 13-3-13.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize colorChoice;
@synthesize flowerView;
@synthesize flowerDetailView;

- (void)viewDidLoad
{
    
    self.flowerDetailView.hidden = YES;
    [self getFlower: nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setColorChoice:nil];
    [self setFlowerView:nil];
    [self setFlowerDetailView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)getFlower:(id)sender {
    NSURL *imageURL;
    NSURL *detailURL;
    NSString *imageURLString;
    NSString *detailURLString;
    NSString *color;
    int sessionID;
    
    color = [self.colorChoice titleForSegmentAtIndex: self.colorChoice.selectedSegmentIndex];
    
    sessionID = random() % 50000;
    
    imageURLString = [[NSString alloc] initWithFormat: @"http://www.floraphotographs.com/showrandomios.php?color=%@&seesion=%d", color, sessionID];
    detailURLString = [[NSString alloc] initWithFormat: @"http://www.floraphotographs.com/detailios.php?seesion=%d", sessionID];
    
    imageURL = [[NSURL alloc] initWithString: imageURLString];
    detailURL = [[NSURL alloc]  initWithString: detailURLString];
    
    [self.flowerView loadRequest: [NSURLRequest requestWithURL:imageURL]];
    [self.flowerDetailView loadRequest: [NSURLRequest requestWithURL: detailURL]];
    
    self.flowerDetailView.backgroundColor = [UIColor clearColor];
}

- (IBAction)toggleFlowerDetail:(id)sender {
    self.flowerDetailView.hidden = ![sender isOn];
}

@end
