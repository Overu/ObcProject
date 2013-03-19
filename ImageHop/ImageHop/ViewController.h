//
//  ViewController.h
//  ImageHop
//
//  Created by zheng libao on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *bunnyView1;
@property (strong, nonatomic) IBOutlet UIImageView *bunnyView2;
@property (strong, nonatomic) IBOutlet UIImageView *bunnyView3;
@property (strong, nonatomic) IBOutlet UIImageView *bunnyView4;
@property (strong, nonatomic) IBOutlet UIImageView *bunnyView5;
@property (strong, nonatomic) IBOutlet UISlider *speedSlider;
@property (strong, nonatomic) IBOutlet UIStepper *speedStepper;
@property (strong, nonatomic) IBOutlet UILabel *hopsPerSecond;
@property (strong, nonatomic) IBOutlet UIButton *toggleButton;

- (IBAction)toggleAnimation:(id)sender;
- (IBAction)setSeed:(id)sender;
- (IBAction)setIncrement:(id)sender;


@end
