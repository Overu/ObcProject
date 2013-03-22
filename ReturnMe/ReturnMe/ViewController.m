//
//  ViewController.m
//  ReturnMe
//
//  Created by zheng libao on 13-3-22.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define kName @"name"
#define kEmail @"email"
#define kPhone @"phone"
#define kPicture @"animal"

@interface ViewController ()

@end

@implementation ViewController
@synthesize animal;
@synthesize name;
@synthesize email;
@synthesize phone;

- (void)viewDidLoad
{
    [self setValuesFromPreferences];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setAnimal:nil];
    [self setName:nil];
    [self setEmail:nil];
    [self setPhone:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)setValuesFromPreferences
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *initialDefaults = [[NSDictionary alloc] initWithObjectsAndKeys: @"Dog",kPicture,@"Your Name1", kName, @"you@yours.com", kEmail, @"1985219161", kPhone, nil];
    
    [userDefaults registerDefaults: initialDefaults];
    
    self.animal.text = [userDefaults stringForKey: kPicture];
    self.name.text = [userDefaults stringForKey: kName];
    self.email.text = [userDefaults stringForKey: kEmail];
    self.phone.text = [userDefaults stringForKey: kPhone];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
