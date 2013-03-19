//
//  AllweatherRadial.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AllweatherRadial.h"

@implementation AllweatherRadial

- (id) init
{
    if (self = [super init]) {
        rainHandling = 30.0;
        snowHandling = 45.0;
    }
    
    return (self);
}

- (NSString *) description
{
    NSString *desc = [[NSString alloc] initWithFormat:@"I am a Tire! pressure: %.1f treadDepth: %.1f rainHandling: %.1f snowHandling: %.1f", pressure, treadDepth, rainHandling, snowHandling];
    return ([desc autorelease]);
}

@synthesize snowHandling;
@synthesize rainHandling;

- (id) copyWithZone: (NSZone *) zone
{
    AllweatherRadial *allCopy = [super copyWithZone: zone];
    
    allCopy.snowHandling = snowHandling;
    allCopy.rainHandling = rainHandling;
    
    return (allCopy);
}

@end
