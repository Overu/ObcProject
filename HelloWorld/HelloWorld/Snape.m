//
//  Snape.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Snape.h"

@implementation Snape

- (void) setFillColor: (Def) c
{
    fillColor = c;
}

- (void) setBounds: (SnapeRect) b
{
    bounds = b;
}

- (NSString*) colorofName:(Def) c
{
    switch (c) {
        case kRedColor:
            return @"red";
            break;
        case kRedBlueColor:
            return @"redblue";
            break;
    }
    return @"no color";
}

- (void) draw
{
}

@end
