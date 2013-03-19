//
//  DataChooserViewController.m
//  Datacalc
//
//  Created by zheng libao on 13-3-16.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "DataChooserViewController.h"

@interface DataChooserViewController ()

@end

@implementation DataChooserViewController

@synthesize delegate;

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
    [self setDelegate:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void) viewDidAppear: (BOOL) animated
{
    ((ViewController *) self.delegate).dateChooserVisible = NO;
    [((ViewController *)self.delegate) calculateDateDifference: [NSDate date]];

}

- (IBAction)setDateTime:(id)sender {
    [((ViewController *)self.delegate) calculateDateDifference: [((UIDatePicker *)sender) date]];
}

- (IBAction)dismissDateChooser:(id)sender {
    ((ViewController *) self.delegate).dateChooserVisible = NO;
    [self dismissViewControllerAnimated: YES completion: nil];
}
@end
