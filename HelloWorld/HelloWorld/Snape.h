//
//  Snape.h
//  HelloWorld
//
//  Created by zheng libao on 12-10-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kRedColor,
    kRedBlueColor
} Def;

typedef struct {
    int x, y, width, height;
} SnapeRect;

@interface Snape : NSObject
{
    Def fillColor;
    SnapeRect bounds;
}

- (void) setFillColor: (Def) fillColor;

- (NSString*) colorofName: (Def) fillColor;

- (void) setBounds: (SnapeRect) bounds;

- (void) draw;

@end
