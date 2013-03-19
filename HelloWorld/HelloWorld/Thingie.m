//
//  Thingie.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Thingie.h"

@implementation Thingie

@synthesize name;
@synthesize magicNumber;
@synthesize shoeSize;
@synthesize subThingies;

- (id) initWithName: (NSString *) n magicNumber: (int) m shoeSiez: (float) s
{
    if (self = [super init]) {
        self.name = n;
        self.magicNumber = m;
        self.shoeSize = s;
        self.subThingies = [NSMutableArray array];
    }
    
    return (self);
}

- (void) dealloc
{
    NSLog(@"%@ is dealloc!!", name);
    
    self.name = nil;
    self.subThingies = nil;
    
    [super dealloc];
}

- (void) encodeWithCoder: (NSCoder *) aCoder
{
    [aCoder encodeObject: name forKey: @"name"];
    [aCoder encodeInt: magicNumber forKey: @"magicNumber"];
    [aCoder encodeDouble: shoeSize forKey: @"shoeSize"];
    [aCoder encodeObject: subThingies forKey: @"subThingies"];
    
}

- (id) initWithCoder: (NSCoder *) aDecoder
{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey: @"name"];
        self.magicNumber = [aDecoder decodeIntForKey: @"magicNumber"];
        self.shoeSize = [aDecoder decodeDoubleForKey: @"shoeSize"];
        self.subThingies = [aDecoder decodeObjectForKey: @"subThingies"];
    }
    
    return (self);
}

- (NSString *) description
{
    NSString *des = [NSString stringWithFormat: @"%@ %d %.1f %@", name, magicNumber, shoeSize, subThingies];
    
    return ([des autorelease]);
}

@end
