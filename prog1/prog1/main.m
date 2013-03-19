//
//  main.m
//  prog1
//
//  Created by zheng libao on 13-2-27.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"
#import "Test1.h"

#define INTOBJ(v) ([NSNumber numberWithInteger: v]);

struct TestPoint
{
    int x;
    int y;
};

int gInt = 50;

typedef enum {january = 1, february, march, april, may, june} Month;

void printMessage (int a)
{
    NSLog(@"printMessage-%d", a);
}

void (^printMessageBlock) (int) = ^(int a) {
    NSLog(@"printMessageBlock-%d", a);
};

void function1 (int a) {
    a++;
}

void function2 (int *a) {
    *a += 1;
    NSLog(@"zhizhen-%e", a);
}

void lookup (void)
{
    
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        id current;
        
//        int (*entry) (void);   
        
//        entry = lookup;
        
        NSNumber *number = INTOBJ(5);
        
        NSLog(@"NSNumber-%d", [number intValue]);
        
        char *str = "abc";
        str = "def";
        NSLog(@"%s", str);
        
        int a[] = {1, 2, 3, 4};
        int *b = (int []) {1, 2 ,3};
        NSLog(@"%d", *b + 1);
        NSLog(@"%d", *b + 2);
        
        struct TestPoint point1 = {.x = 5, .y = 6}, *point2 = &point1;
        
        Test *test = [[Test alloc] init];
        [test setAa: 5];
        Test *test2;
        current = test;
        test2 = current;
        [test2 print];  
        
        int i = 5;
        
        function1(i);
        NSLog(@"function1-%e", i);
        function2(&i);
        NSLog(@"function2-%d", i);
        
        Test1 *test1 = [[Test1 alloc] init];
        [test1 setAa:10];
        [test1 print];
        
        // insert code here...
        NSLog(@"Hello, World!");
        printMessage(5);
        printMessageBlock(100);
        printABCD(10);
        
        Month amonth;
        amonth = january;
        
        switch (amonth) {
            case january:
            case february:
            case march:
            case april:
            case may:
                NSLog(@"SO COOL");
                break;
            case june:
                NSLog(@"SO COOL1");
                break;
                
            default:
                break;
        }
        
    }
    return 0;
}

