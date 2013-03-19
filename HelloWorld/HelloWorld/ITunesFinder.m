//
//  ItunesFinder.m
//  HelloWorld
//
//  Created by zheng libao on 12-10-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ITunesFinder.h"

@implementation ITunesFinder

- (void) netServiceBrowser: (NSNetServiceBrowser *) b 
           didFindService: (NSNetService *) service 
               moreComing: (BOOL) moreComing
{
    [service resolveWithTimeout: 10];
    
    NSLog(@"found one name is %@", [service name]);
}

- (void) netServiceBrowser: (NSNetServiceBrowser *) b 
         didRemoveService: (NSNetService *) service 
               moreComing: (BOOL) moreComing
{
    [service resolveWithTimeout: 10];
    
    NSLog(@"lost Conection Name is %@", [service name]);
}

@end
