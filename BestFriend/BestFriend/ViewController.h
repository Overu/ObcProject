//
//  ViewController.h
//  BestFriend
//
//  Created by zheng libao on 13-4-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MapKit/Mapkit.h>
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MessageUI.h>
#import <Twitter/Twitter.h>

@interface ViewController : UIViewController<ABPeoplePickerNavigationControllerDelegate, MKMapViewDelegate, MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet MKMapView *map;

@property (strong, nonatomic) MKPlacemark *zipAnnotation;

- (IBAction)newBff:(id)sender;
- (IBAction)sendEmail:(id)sender;
- (IBAction)sendTweet:(id)sender;

- (void) centerMap: (NSString *) zipCode showAddress: (NSDictionary *) fullAddress;
@end
