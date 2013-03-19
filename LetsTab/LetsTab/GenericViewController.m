//
//  GenericViewController.m
//  LetsTab
//
//  Created by zheng libao on 13-3-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GenericViewController.h"

@interface GenericViewController ()

@end

@implementation GenericViewController
@synthesize outputLabel;
@synthesize barItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setOutputLabel:nil];
    [self setBarItem:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)incrementCountFirst:(id)sender {
    ((CountingViewController *)self.parentViewController).firstCount++;
    [self doUpdate];
}

- (IBAction)incrementCountSecond:(id)sender {
    ((CountingViewController *)self.parentViewController).secondCount++;
    [self doUpdate];
}

- (IBAction)incrementCountThird:(id)sender {
    ((CountingViewController *)self.parentViewController).thirdCount++;
    [self doUpdate];
}

- (void) doUpdate
{
    [self updateBadge];
    [self updateCounts];
}

- (void) updateBadge
{
    NSString *badgeCount;
    int currentBadger;
    currentBadger = [self.barItem.badgeValue intValue];
    currentBadger ++;
    badgeCount = [[NSString alloc] initWithFormat: @"%d", currentBadger];
    
    self.barItem.badgeValue = badgeCount;
}

- (void) updateCounts
{
    CountingViewController *countingVC = (CountingViewController *)self.parentViewController;
    
    NSString *countString;
    countString = [[NSString alloc] initWithFormat: @"First: %d\nSecond: %d\nThird: %d", countingVC.firstCount, countingVC.secondCount, countingVC.thirdCount];
    
    self.outputLabel.text = countString;
}

@end
