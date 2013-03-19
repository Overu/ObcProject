//
//  Garage.h
//  HelloWorld
//
//  Created by zheng libao on 12-10-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;

@interface Garage : NSObject
{
    NSString *name;
    NSMutableArray *cars;
    NSMutableDictionary *stuff;

}

@property (copy) NSString *name;
@property (retain, readonly) NSMutableArray *cars;

- (void) addCar: (Car *) car;

- (void) print;

@end
