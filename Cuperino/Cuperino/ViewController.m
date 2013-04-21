//
//  ViewController.m
//  Cuperino
//
//  Created by zheng libao on 13-4-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define kCupertinoLatitude 37.3229978
#define kCupertinoLongitude -122.0321823

@interface ViewController ()

@end

@implementation ViewController
@synthesize distanceLabel;
@synthesize distanceView;
@synthesize waitView;
@synthesize locMan;

- (void)viewDidLoad
{
    self.locMan = [[CLLocationManager alloc] init];
    self.locMan.delegate = self;
    self.locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    self.locMan.distanceFilter = 1609;
    [self.locMan startUpdatingLocation];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (error.code == kCLErrorDenied) {
        [self.locMan stopUpdatingLocation];
        [self setLocMan: nil];
    }
    
    self.waitView.hidden = YES;
    self.distanceView.hidden = NO;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (newLocation.horizontalAccuracy >= 0) {
        CLLocation *cupertino = [[CLLocation alloc] initWithLatitude:kCupertinoLatitude longitude:kCupertinoLongitude];
        CLLocationDistance delta = [cupertino distanceFromLocation:newLocation];
        
        long miles = (delta * 0.000621371) + 0.5;
        if (miles < 3) {
            [self.locMan stopUpdatingLocation];
            self.distanceLabel.text = @"Enjoy the\nMothership";
        } else {
            NSNumberFormatter *commaDelimited = [[NSNumberFormatter alloc] init];
            [commaDelimited setNumberStyle: NSNumberFormatterDecimalStyle];
            self.distanceLabel.text = [[NSString alloc] initWithFormat: @"%@ miles to the\nMothership", [commaDelimited stringFromNumber:[NSNumber numberWithLong: miles]]];
        }
        self.waitView.hidden = YES;
        self.distanceView.hidden = NO;
    }
}

- (void)viewDidUnload
{
    [self setDistanceLabel:nil];
    [self setDistanceView:nil];
    [self setWaitView:nil];
    [self setLocMan:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
