//
//  CategoryThing.h
//  HelloWorld
//
//  Created by zheng libao on 12-10-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryThing : NSObject
{
    int thing1;
    int thing2;
    int thing3;
}

@end

@interface CategoryThing (Thing1)

- (void) setThing1: (int) thing1;
- (int) thing1;

@end

@interface CategoryThing (Thing2)

- (void) setThing2: (int) thing2;
- (int) thing2;

@end

@interface CategoryThing (Thing3)

- (void) setThing3: (int) thing3;
- (int) thing3;

@end