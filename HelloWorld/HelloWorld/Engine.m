//
//  Engine.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Engine.h"

@implementation Engine

@synthesize horsepower;

- (id) init
{
    if (self = [super init]) {
        horsepower = 150;
    }
    
    return (self);
}

- (NSString*) description
{
    NSString *desc = [[NSString alloc] initWithFormat:@"I am Engine!"];
    
    return ([desc autorelease]);
}

- (void) dealloc
{
    NSLog(@"engine ddealloc");
    
    [super dealloc];
}

- (id) copyWithZone: (NSZone *) zone
{
    Engine *engineCopy = [[[self class] allocWithZone: zone] init];
    
    return (engineCopy);
}

@end
