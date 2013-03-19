//
//  Tire.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Tire.h"

@implementation Tire

- (id) init
{
    if (self = [self initWithPressure: 34.0 treadDepth: 20.0]) {
    }
    
    return (self);
}

- (id) initWithPressure: (float) p
{
    if (self = [self initWithPressure: p treadDepth: 20.0]) {
    }
    
    return (self);
}

- (id) initWithTreadDepth: (float) t
{
    if (self = [self initWithPressure: 24.0 treadDepth: t]) {
    }
    
    return (self);
}

- (id) initWithPressure: (float) p treadDepth: (float) t
{
    if (self = [super init]) {
        pressure = p;
        treadDepth = t;
    }
    
    return (self);
}

- (NSString*) description
{
    NSString *desc = [[NSString alloc] initWithFormat:@"I am a Tire! pressure: %.1f treadDepth: %.1f", pressure, treadDepth];
    return ([desc autorelease]);
}

- (float) pressure
{
    return (pressure);
}

- (void) setPressure: (float) p
{
    pressure = p;
}

- (float) treadDepth
{
    return (treadDepth);
}

- (void) setTreadDepth: (float) t
{
    treadDepth = t;
}

- (id) copyWithZone: (NSZone *) zone
{
    Tire *tireCopy = [[[self class] allocWithZone: zone] initWithPressure: pressure treadDepth:treadDepth];
    
    return (tireCopy);
}

- (void) dealloc
{
    NSLog(@"Tire is dealloc!");
    
    [super dealloc];
}

@end
