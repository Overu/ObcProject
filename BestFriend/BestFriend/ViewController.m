//
//  ViewController.m
//  BestFriend
//
//  Created by zheng libao on 13-4-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize name;
@synthesize email;
@synthesize photo;
@synthesize map;
@synthesize zipAnnotation;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setName:nil];
    [self setEmail:nil];
    [self setPhoto:nil];
    [self setMap:nil];
    [self setZipAnnotation:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)newBff:(id)sender {
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    
    picker.peoplePickerDelegate = self;
    [self presentModalViewController: picker animated: YES];
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    NSString *friendName;
    NSString *friendEmail;
    NSString *friendZip;
    
    friendName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    self.name.text = friendName;
    
    ABMultiValueRef friendAddressSet;
    NSDictionary *friendFirstAddress;
    friendAddressSet = ABRecordCopyValue(person, kABPersonAddressProperty);
    if (ABMultiValueGetCount(friendAddressSet) > 0) {
        friendFirstAddress = (__bridge NSDictionary *)ABMultiValueCopyValueAtIndex(friendAddressSet, 0);
        friendZip = [friendFirstAddress objectForKey: @"ZIP"];
        [self centerMap:friendZip showAddress:friendFirstAddress];
    }
    
    ABMultiValueRef friendEmailAddresses;
    friendEmailAddresses = ABRecordCopyValue(person, kABPersonEmailProperty);
    
    if (ABMultiValueGetCount(friendAddressSet) > 0) {
        friendEmail = (__bridge NSString *)ABMultiValueCopyValueAtIndex(friendEmailAddresses, 0);
        self.email.text = friendEmail;
    }
    
    if (ABPersonHasImageData(person)) {
        self.photo.image = [UIImage imageWithData: (__bridge NSData *)ABPersonCopyImageData(person)];
    }
    
    [self dismissModalViewControllerAnimated: YES];
    return NO;
}

- (void)centerMap:(NSString *)zipCode showAddress:(NSDictionary *)fullAddress
{
    NSString *queryURL;
    NSString *queryResults;
    NSArray *queryData;
    
    double latitude;
    double longitude;
    
    MKCoordinateRegion mapRegion;
    
    queryURL = [[NSString alloc] initWithFormat: @"http://map.google.com/maps/geo?output=csv&q=%@", zipCode];
    
    queryResults = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:queryURL] encoding: NSUTF8StringEncoding error:nil];
    
    queryData =[queryResults componentsSeparatedByString:@","];
    
    if ([queryData count] == 4) {
        latitude = [[queryData objectAtIndex: 2] doubleValue];
        longitude = [[queryData objectAtIndex: 3] doubleValue];
        mapRegion.center.latitude = latitude;
        mapRegion.center.latitude = longitude;
        mapRegion.span.latitudeDelta = 0.2;
        mapRegion.span.longitudeDelta = 0.2;
        [self.map setRegion: mapRegion animated: YES];
        
        if (zipAnnotation != nil) {
            [self.map removeAnnotation: zipAnnotation];
        }
        zipAnnotation = [[MKPlacemark alloc] initWithCoordinate:mapRegion.center addressDictionary: fullAddress];
        
        [self.map addAnnotation: zipAnnotation];
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pinDrop = [[MKPinAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"myspot"];
    pinDrop.animatesDrop = YES;
    pinDrop.canShowCallout = YES;
    pinDrop.pinColor = MKPinAnnotationColorPurple;
    return pinDrop;
}

- (IBAction)sendEmail:(id)sender {
    MFMailComposeViewController *mailComposer;
    NSArray *emailAddresses;
    emailAddresses = [[NSArray alloc] initWithObjects: self.email.text, nil];
    
    mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setToRecipients:emailAddresses];
    [self presentModalViewController: mailComposer animated: YES];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissModalViewControllerAnimated: YES];
}

- (IBAction)sendTweet:(id)sender {
    TWTweetComposeViewController *tweetComposer;
    tweetComposer = [[TWTweetComposeViewController alloc] init];
    if ([TWTweetComposeViewController canSendTweet]) {
        [tweetComposer setInitialText: @"ha"];
        [self presentModalViewController: tweetComposer animated: YES];
    }
}
@end
