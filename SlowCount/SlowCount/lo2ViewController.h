//
//  lo2ViewController.h
//  SlowCount
//
//  Created by zheng libao on 13-4-24.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lo2ViewController : UIViewController
{
    int ccount;
    UIBackgroundTaskIdentifier counterTask;
}
@property (strong, nonatomic) IBOutlet UILabel *count;
@property (strong, nonatomic) NSTimer *theTimer;

- (void) countUp;

@end
