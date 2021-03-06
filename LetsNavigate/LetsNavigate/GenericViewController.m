//
//  GenericViewController.m
//  LetsNavigate
//
//  Created by zheng libao on 13-3-18.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GenericViewController.h"

@interface GenericViewController ()

@end

@implementation GenericViewController
@synthesize pushCount;

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
    [self setPushCount:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) viewDidAppear: (BOOL) animated
{
    NSString *pushText;
    pushText = [[NSString alloc] initWithFormat: @"%d", ((CountingNavigationController *) self.parentViewController).pushCount];
    self.pushCount.text = pushText;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)incrementCount:(id)sender {
    ((CountingNavigationController *)self.parentViewController).pushCount++;
}
@end
