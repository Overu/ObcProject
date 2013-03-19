//
//  AppController.m
//  AppController
//
//  Created by zheng libao on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (id) init
{
    if (self = [super init]) {
        NSLog(@"init: text %@ / results%@", textField, resourField);
    }
    
    return (self);
}

- (void) awakeFromNib
{
    NSLog(@"init: text %@ / results%@", textField, resourField);
    
    [textField setStringValue: @"Enter text here"];
    [resourField setStringValue: @"Results"];
}

- (void) uppercase: (id) sender
{
    [resourField setStringValue: [[textField stringValue] uppercaseString]];
}

- (void) lowercase: (id) sender
{
    [resourField setStringValue: [[textField stringValue] lowercaseString]];
}

@end
