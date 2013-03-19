//
//  Thingie.h
//  HelloWorld
//
//  Created by zheng libao on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Thingie : NSObject <NSCoding>
{
    NSString *name;
    int magicNumber;
    float shoeSize;
    NSMutableArray *subThingies;
}

@property (copy) NSString *name;
@property int magicNumber;
@property float shoeSize;
@property (retain) NSMutableArray *subThingies;

- (id) initWithName: (NSString *) n 
        magicNumber: (int) m 
           shoeSiez: (float) s;

@end
