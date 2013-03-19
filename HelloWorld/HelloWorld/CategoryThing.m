//
//  CategoryThing.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CategoryThing.h"

@implementation CategoryThing

- (NSString *)description
{
    NSString *desc = [NSString stringWithFormat: @"%d %d %d", thing1, thing2, thing3];
    
    return ([desc autorelease]);
}

- (void) dealloc
{
    NSLog(@"CategoryThing is dealloc!");
    
    [super dealloc];
}

@end

@implementation CategoryThing (Thing1)

- (void) setThing1: (int) t1
{
    thing1 = t1;
}

- (int) thing1
{
    return (thing1);
}

@end

@implementation CategoryThing (Thing2)

- (void) setThing2: (int) t2
{
    thing2 = t2;
}

- (int) thing2
{
    return (thing2);
}

@end

@implementation CategoryThing (Thing3)

- (void) setThing3: (int) t3
{
    thing3 = t3;
}

- (int) thing3
{
    return (thing3);
}

@end
