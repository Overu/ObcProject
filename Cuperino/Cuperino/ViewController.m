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
#define kDeg2Rad 0.0174532925
#define kRad2Deg 57.2957795

@interface ViewController ()

@end

@implementation ViewController
@synthesize distanceLabel;
@synthesize distanceView;
@synthesize waitView;
@synthesize directionArrow;
@synthesize locMan;
@synthesize recentLocation;

- (void)viewDidLoad
{
    self.locMan = [[CLLocationManager alloc] init];
    self.locMan.delegate = self;
    self.locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    self.locMan.distanceFilter = 1609;
    [self.locMan startUpdatingLocation];
    
    if ([CLLocationManager headingAvailable]) {
        self.locMan.headingFilter = 10;
        [self.locMan startUpdatingHeading];
    }
    
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
        self.recentLocation = newLocation;
        
        CLLocation *cupertino = [[CLLocation alloc] initWithLatitude:kCupertinoLatitude longitude:kCupertinoLongitude];
        CLLocationDistance delta = [cupertino distanceFromLocation:newLocation];
        
        long miles = (delta * 0.000621371) + 0.5;
        if (miles < 3) {
            [self.locMan stopUpdatingLocation];
            self.distanceLabel.text = @"Enjoy the\nMothership";
            [self.locMan stopUpdatingHeading];
        } else {
            NSNumberFormatter *commaDelimited = [[NSNumberFormatter alloc] init];
            [commaDelimited setNumberStyle: NSNumberFormatterDecimalStyle];
            self.distanceLabel.text = [[NSString alloc] initWithFormat: @"%@ miles to the\nMothership", [commaDelimited stringFromNumber:[NSNumber numberWithLong: miles]]];
        }
        self.waitView.hidden = YES;
        self.distanceView.hidden = NO;
    }
}

- (double)headingToLocation:(CLLocationCoordinate2D)desired current:(CLLocationCoordinate2D)current
{
    double lat1 = current.latitude * kDeg2Rad;
    double lat2 = desired.latitude * kDeg2Rad;
    double lon1 = current.longitude;
    double lon2 = desired.longitude;
    double dlon = (lon2 - lon1) * kDeg2Rad;
    
    double x = sin(dlon) * cos(lat2);
    double y = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dlon);
    
    double heading = atan2(y, x);
    heading = heading * kRad2Deg;
    heading = heading + 360.0;
    heading = fmod(heading, 360.0);
    return heading;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    if (self.recentLocation != nil && newHeading.headingAccuracy >=0) {
        CLLocation *cupertino = [[CLLocation alloc] initWithLatitude:kCupertinoLatitude longitude:kCupertinoLongitude];
        
        double course = [self headingToLocation:cupertino.coordinate current:recentLocation.coordinate];
        
        double delta = newHeading.trueHeading - course;
        
        if (abs(delta) <= 10) {
            self.directionArrow.text = @"up";
        } else {
            if (delta > 180) {
                self.directionArrow.text = @"right";
            } else if (delta > 0) {
                self.directionArrow.text = @"left";
            } else if (delta > -180) {
                self.directionArrow.text = @"right";
            } else {
                self.directionArrow.text = @"left";
            }
        }
    } else {
        self.directionArrow.text = @"no";
    }
}

- (void)viewDidUnload
{
    [self setDistanceLabel:nil];
    [self setDistanceView:nil];
    [self setWaitView:nil];
    [self setLocMan:nil];
    [self setDirectionArrow:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
