//
//  NSString+NumberConvenience.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSString+NumberConvenience.h"

@implementation NSString (NumberConvenience)

- (NSNumber *) lengthAsNumber
{
    unsigned length = [self length];
    
    return ([NSNumber numberWithInt: length]);
}

- (void) dealloc
{
    NSLog(@"String dealloc");
    
    [super dealloc];
}

@end
