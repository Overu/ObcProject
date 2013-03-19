//
//  Slant6.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Slant6.h"

@implementation Slant6

- (NSString *) description
{
    return (@"I am a Slant6 Engine!");
}

- (void) dealloc
{
    NSLog(@"Slant6 is dealloc!!");
    
    [super dealloc];
}
@end
