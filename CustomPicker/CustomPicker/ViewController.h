//
//  ViewController.h
//  CustomPicker
//
//  Created by zheng libao on 13-3-17.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalChooserViewController.h"

@interface ViewController : UIViewController<UIPopoverControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (strong, nonatomic) UIPopoverController *animalPopoverController;
@property (nonatomic) Boolean animalChooserVisible;

- (IBAction)showAnimalChooser:(id)sender;

- (void) displayAnimal: (NSString *) chosenAnimal withSound: (NSString *) chosenSound fromComponent: (NSString *) chosenComponent;

@end
