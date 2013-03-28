//
//  ViewController.h
//  Orientation
//
//  Created by zheng libao on 13-3-28.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *orientationLabel;

- (void) orientionChanged: (NSNotification *) notification;

@end
