//
//  Rectangle.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

- (void) draw
{
    NSLog(@"drawing a rectangle at (%d %d %d %d) in %@",bounds.x, bounds.y, bounds.width, bounds.height, [super colorofName: fillColor]);
}
@end
