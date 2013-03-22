//
//  ViewController.m
//  Survey
//
//  Created by zheng libao on 13-3-22.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize firstName;
@synthesize lastName;
@synthesize email;
@synthesize resultsView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setFirstName:nil];
    [self setLastName:nil];
    [self setEmail:nil];
    [self setResultsView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)storeResults:(id)sender {
    NSString *csvLine = [[NSString alloc] initWithFormat:@"%@,%@,%@\n", self.firstName.text, self.lastName.text, self.email.text];

    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex: 0];
    
    NSString *surveyFile = [docDir stringByAppendingPathComponent: @"surveyresults.csv"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath: surveyFile]) {
        [[NSFileManager defaultManager] createFileAtPath: surveyFile contents: nil attributes: nil];
    }
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath: surveyFile];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData: [csvLine dataUsingEncoding: NSUTF8StringEncoding]];
    
    [fileHandle closeFile];
    
    self.firstName.text = @"";
    self.lastName.text = @"";
    self.email.text = @"";
}

- (IBAction)showResults:(id)sender {
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *surveyFile = [docDir stringByAppendingPathComponent: @"surveyresults.csv"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath: surveyFile]) {
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath: surveyFile];
        NSString *surveyResults = [[NSString alloc] initWithData: [fileHandle availableData] encoding:NSUTF8StringEncoding];
        
        [fileHandle closeFile];
        self.resultsView.text = surveyResults;
    }
}

- (IBAction)hideKeyBoard:(id)sender {
    
}

- (IBAction)hideKeyBoard1:(id)sender {
    [self.firstName resignFirstResponder];
    [self.lastName resignFirstResponder];
    [self.email resignFirstResponder];
}
@end
