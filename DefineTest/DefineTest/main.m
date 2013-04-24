//
//  main.m
//  DefineTest
//
//  Created by zheng libao on 13-4-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test2.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        Test1 *test1 = [[Test1 alloc] init];
        [test1 print];
        Test2 *test2 = [[Test2 alloc] init];
        [test2 print];
        [test1 print];
        
    }
    return 0;
}

