//
//  ViewController.m
//  Datacalc
//
//  Created by zheng libao on 13-3-16.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize outputLabel;
@synthesize dateChooserVisible;

- (void)viewDidLoad
{
//    UIStoryboard *mainSB = [UIStoryboard storyboardWithName: @"MainStoryboard" bundle: nil];
//    
//    DataChooserViewController *dataChooserVC = [mainSB instantiateViewControllerWithIdentifier: @"DataChooser"];
//    dataChooserVC.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setOutputLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    ((DataChooserViewController *) segue.destinationViewController).delegate = self;
    
}

- (IBAction)showDateChooser:(id)sender {
    if (self.dateChooserVisible != YES) {
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName: @"MainStoryboard" bundle: nil];
        
        DataChooserViewController *dataChooserVC = [mainStoryBoard instantiateViewControllerWithIdentifier: @"DataChooser"];
        dataChooserVC.delegate = self;
        dataChooserVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        dataChooserVC.modalPresentationStyle = UIModalPresentationFormSheet;
        
        [self presentViewController: dataChooserVC animated: YES completion: nil];
        
        self.dateChooserVisible = YES;
    }
}

- (void)calculateDateDifference: (NSDate *) chosenDate
{
    NSDate *todaysDate;
    NSString *differenceOutput;
    NSString *todaysDateString;
    NSString *chosenDateString;
    NSDateFormatter *dateFormat;
    NSTimeInterval difference;
    
    todaysDate = [NSDate date];
    difference = [todaysDate timeIntervalSinceDate: chosenDate] / 86400;
    
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat: @"MMMM d, yyyy hh:mm:ssa"];
    todaysDateString = [dateFormat stringFromDate: todaysDate];
    chosenDateString = [dateFormat stringFromDate: chosenDate];
    
    differenceOutput = [[NSString alloc] initWithFormat: @"Difference between chosen data (%@) and today (%@) in days: %1.2f", chosenDateString, todaysDateString, fabs(difference)];
    self.outputLabel.text = differenceOutput;
}

@end
