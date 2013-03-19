//
//  Circle.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Circle.h"

@implementation Circle

- (void) draw
{
     NSLog(@"drawing a cricle at (%d %d %d %d) in %@",bounds.x, bounds.y, bounds.width, bounds.height, [super colorofName: fillColor]);
}

@end
