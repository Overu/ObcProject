//
//  Tire.h
//  HelloWorld
//
//  Created by zheng libao on 12-10-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tire : NSObject <NSCopying>

{
    float pressure;
    float treadDepth;
}

- (id) initWithPressure: (float) pressure;
- (id) initWithTreadDepth: (float) treadDepth;
- (id) initWithPressure: (float) pressure 
             treadDepth: (float) treadDepth;

- (float) pressure;
- (void) setPressure: (float) pressure;

- (float) treadDepth;
- (void) setTreadDepth: (float) treadDepth;

@end
