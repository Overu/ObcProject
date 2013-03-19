//
//  Test1.m
//  prog1
//
//  Created by zheng libao on 13-2-28.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Test1.h"

@implementation Test1

@synthesize a = _a;

- (void) print1
{
    NSLog(@"%d", _a);
}

- (void) print
{
    NSLog(@"Test1 - %d", a);
    [super print];
}

- (void) setCopy: (id<NSCopying> *) id
{
    
}

@end
