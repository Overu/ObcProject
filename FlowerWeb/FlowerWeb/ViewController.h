//
//  ViewController.h
//  FlowerWeb
//
//  Created by zheng libao on 13-3-13.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (strong, nonatomic) IBOutlet UIWebView *flowerView;
@property (strong, nonatomic) IBOutlet UIWebView *flowerDetailView;


- (IBAction)getFlower:(id)sender;
- (IBAction)toggleFlowerDetail:(id)sender;


@end
