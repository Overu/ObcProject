//
//  Car.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Car.h"
#import "Engine.h"
#import "Tire.h"

@implementation Car

- (id) init
{
    if (self = [super init]) {
        self.name = @"car";
        tire = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 4; i++) {
            [tire addObject: [NSNull null]];
        }
    }
    
    return (self);
}

@synthesize engine;
@synthesize name;
@synthesize make;
@synthesize model;
@synthesize numberOfDoors;
@synthesize modelYear;
@synthesize mileage;

- (Tire *) tireAtIndex: (int) index
{
    return ([tire objectAtIndex: index]);
}

- (void) setTire:(Tire *) newtire atIndex:(int) index 
{
    [tire replaceObjectAtIndex: index withObject: newtire];
}

- (void) print
{
    NSLog(@"car name:%@", name);
    NSLog(@"engine name:%@", engine);
    
    for (int i = 0; i < 4; i++) {
        NSLog(@"%@", [self tireAtIndex: i]);
    }
}

- (NSString *) description
{
    NSString *des = [NSString stringWithFormat: @"%@ , %d %@ %@ has %d doors, %.1f mileas and %@ hp and %d tires", name, modelYear, make, model, numberOfDoors, mileage, [engine valueForKey: @"horsepower"] ,[tire count]];
    
    return ([des autorelease]);
}

- (id) copyWithZone: (NSZone *) zone
{
    Car *carCopy = [[[self class] allocWithZone: zone] init];
    
    carCopy.name = self.name;
    
    Engine *engineCopy = [[engine copy] autorelease];
    carCopy.engine = engineCopy;    
    
    for (int i = 0; i < 4; i++) {
        Tire *tireCopy = [[self tireAtIndex: i] copy];
        [carCopy setTire: tireCopy atIndex: i];
        
        [tireCopy release];
    }
    
    carCopy.mileage = mileage;
    carCopy.numberOfDoors = numberOfDoors;
    carCopy.modelYear = modelYear;
    
    carCopy.model = model;
    carCopy.make = make;
    
    return (carCopy);
}

- (void) dealloc
{
    self.name = nil;
    self.model = nil;
    self.make = nil;
    self.engine = nil;  //通过@property可以使用这种方式回收
    [tire release];
    
    NSLog(@"Car is dealloc");
    
    [super dealloc];
}


//处理键值特殊情况的代码
- (void) setNilValueForKey: (NSString *) key
{
    if ([key isEqualToString: @"mileage"]) {
        mileage = 0;
    } else {
        [super setNilValueForKey: key];
    }
}

@end
