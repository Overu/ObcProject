//
//  lo2ViewController.m
//  SlowCount
//
//  Created by zheng libao on 13-4-24.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "lo2ViewController.h"

@interface lo2ViewController ()

@end

@implementation lo2ViewController
@synthesize count;
@synthesize theTimer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    counterTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
    }];
    ccount = 0;
    self.theTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setCount:nil];
    [self setTheTimer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)countUp
{
    if (ccount == 1000) {
        [self.theTimer invalidate];
        [self setTheTimer:nil];
        [[UIApplication sharedApplication] endBackgroundTask:counterTask];
    } else {
        ccount ++;
        NSString *currentCount;
        currentCount = [[NSString alloc] initWithFormat:@"%d", ccount];
        self.count.text = currentCount;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
