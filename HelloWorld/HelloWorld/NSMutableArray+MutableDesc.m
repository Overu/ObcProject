//
//  NSMutableArray+MutableDesc.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSMutableArray+MutableDesc.h"

@implementation NSMutableArray (MutableDesc)

- (void) dealloc
{
    NSLog(@"MutableArray is dealloc!!");
    
    [super dealloc];
}

@end
