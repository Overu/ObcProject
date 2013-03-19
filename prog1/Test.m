//
//  Test.m
//  prog1
//
//  Created by zheng libao on 13-2-27.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Test.h"

extern int gInt;
static int gCount = 10;

void printABCD (int a)
{
    NSLog(@"printABCD-%d", a);
}

//private
@interface Test ()

@property int id;

- (void) setValue: (int) number;

@end

@implementation Test

@synthesize id;

- (void) print 
{
    NSLog(@"%d-%d-%d", a, gInt, gCount);
    
}

- (void) setAa: (int) aa
{
    a = aa;
}

- (void) setValue: (int) number
{
    self.id = number;
}

@end
