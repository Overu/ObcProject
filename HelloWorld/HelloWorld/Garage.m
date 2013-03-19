//
//  Garage.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Garage.h"

@implementation Garage

@synthesize name;
@synthesize cars;

- (void) addCar: (Car *) car
{
    if (cars == nil) {
        cars = [[NSMutableArray alloc] init];
    }
    
    [cars addObject: car];
}

- (void) print
{
    NSLog(@"name:%@", name);
    
    for (Car *car in cars) {
        NSLog(@"car:%@" , car);
    }
}
 
- (void) dealloc
{
    self.name = nil;
    [cars release];
    [stuff release];
    
    NSLog(@"Garage is dealloc!");
    
    [super dealloc];
}

- (void) setValue: (id) value forUndefinedKey: (NSString *) key
{
    if(stuff == nil) {
        stuff = [[NSMutableDictionary alloc] init];
    }
    
    [stuff setValue: value forKey: key];
}

-  (id) valueForUndefinedKey: (NSString *) key
{
    return ([stuff valueForKey: key]);
}

@end
