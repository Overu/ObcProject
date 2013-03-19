//
//  Car.h
//  HelloWorld
//
//  Created by zheng libao on 12-10-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Tire.h"
//#import "Engine.h"

@class Tire;
@class Engine;

@interface Car : NSObject <NSCopying>
{
    NSString *name;
    NSMutableArray *tire;
    Engine *engine;
    
    NSString *make;
    NSString *model;
    int modelYear;
    int numberOfDoors;
    float mileage;
}

@property (copy) NSString *name;
@property (retain) Engine *engine;
@property (copy) NSString *make;
@property (copy) NSString *model;
@property int modelYear;
@property int numberOfDoors;
@property float mileage;

- (void) print;

- (Tire *) tireAtIndex: (int) index;

-(void) setTire: (Tire *) tire 
        atIndex: (int) index;
@end

@interface Car (PrivateMethods)

- (void) moveTireFromPosition: (int) post1 
                   toPosition: (int) post2;

@end
