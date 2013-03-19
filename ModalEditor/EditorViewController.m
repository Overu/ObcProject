//
//  EditorViewController.m
//  ModalEditor
//
//  Created by zheng libao on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()

@end

@implementation EditorViewController

@synthesize emailField;

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
    self.emailField.text = ((ViewController *) self.presentingViewController).emailLabel.text;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setEmailField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)dismissEditor:(id)sender {
    ((ViewController *) self.presentingViewController).emailLabel.text = self.emailField.text;
    [self dismissViewControllerAnimated: YES completion: nil];
}
@end
