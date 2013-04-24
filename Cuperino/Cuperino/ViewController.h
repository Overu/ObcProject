//
//  ViewController.h
//  Cuperino
//
//  Created by zheng libao on 13-4-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UIView *distanceView;
@property (strong, nonatomic) IBOutlet UIView *waitView;
@property (strong, nonatomic) IBOutlet UILabel *directionArrow;

@property (strong, nonatomic) CLLocation *recentLocation;

@property (strong, nonatomic) CLLocationManager *locMan;

- (double) headingToLocation: (CLLocationCoordinate2D) desired current: (CLLocationCoordinate2D) current;

@end
