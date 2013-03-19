//
//  ViewController.m
//  CustomPicker
//
//  Created by zheng libao on 13-3-17.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize outputLabel;
@synthesize animalChooserVisible;
@synthesize animalPopoverController;

- (void)viewDidLoad
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName: @"MainStoryboard" bundle: nil];
    AnimalChooserViewController *animalChooserVC = [mainStoryboard instantiateViewControllerWithIdentifier: @"AnimalChooser"];
    animalChooserVC.delegate = self;
    self.animalPopoverController = [[UIPopoverController alloc] initWithContentViewController: animalChooserVC];
    self.animalPopoverController.delegate = self;
    self.animalPopoverController.popoverContentSize = CGSizeMake(500, 217);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setOutputLabel:nil];
    [self setAnimalPopoverController: nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)showAnimalChooser: (id) sender {
    if (self.animalChooserVisible != YES) {
        [self.animalPopoverController presentPopoverFromBarButtonItem: sender permittedArrowDirections: UIPopoverArrowDirectionAny animated: YES];
//        [self.animalPopoverController presentPopoverFromRect: ((UIView *) sender).frame inView: self.view permittedArrowDirections: UIPopoverArrowDirectionAny animated: YES];
        self.animalChooserVisible = YES;
    }
}

- (void) displayAnimal: (NSString *) chosenAnimal withSound:(NSString *) chosenSound fromComponent: (NSString *) chosenComponent
{
    NSString *animalSoundString = [[NSString alloc] initWithFormat: @"You changed %@ (%@ and the sound %@)", chosenComponent, chosenAnimal, chosenSound];
    self.outputLabel.text = animalSoundString;
}

@end
