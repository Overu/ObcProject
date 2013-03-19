//
//  AnimalChooserViewController.m
//  CustomPicker
//
//  Created by zheng libao on 13-3-17.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "AnimalChooserViewController.h"

#define kComponentCount 2
#define kAnimalComponent 0
#define kSoundComponent 1

@interface AnimalChooserViewController ()

@end

@implementation AnimalChooserViewController

@synthesize delegate;
@synthesize animalNames;
@synthesize animalSounds;
@synthesize animalImages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}

- (void)viewDidLoad
{
    self.animalNames = [[NSArray alloc] initWithObjects: @"Mouse", @"Goose", @"Cat", @"Dog", @"Snake", @"Bear", @"Pig", nil];
    self.animalImages = [[NSArray alloc] initWithObjects: @"mouse.png", @"goose.png", @"cat.png", @"dog.png", @"snake.png", @"bear.png", @"pig.png", nil];
    self.animalSounds = [[NSArray alloc] initWithObjects: @"Oink", @"Rawr", @"Ssss", @"Roof", @"Meow", @"Honk", @"Squeak", nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDelegate: nil];
    [self setAnimalNames: nil];
    [self setAnimalSounds: nil];
    [self setAnimalImages: nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) viewDidAppear: (BOOL) animated
{
    ((ViewController *)self.delegate).animalChooserVisible = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *) pickerView
{
    return kComponentCount;
}

- (NSInteger) pickerView: (UIPickerView *) pickerView numberOfRowsInComponent: (NSInteger) component
{
    if (component == kAnimalComponent) {
        return [self.animalNames count];
    } else {
        return [self.animalSounds count];
    }
}

- (UIView *) pickerView: (UIPickerView *) pickerView viewForRow: (NSInteger) row forComponent: (NSInteger) component reusingView: (UIView *) view
{
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 100, 32)];
    label.backgroundColor = [UIColor clearColor];
    if (component == kAnimalComponent) {
        label.text = [animalImages objectAtIndex: row];
        return label;
    } else {
        label.text = [animalSounds objectAtIndex: row];
        return label;
    }
}

- (CGFloat) pickerView: (UIPickerView *) pickerView rowHeightForComponent: (NSInteger) component
{
    return 55.0;
}

- (CGFloat) pickerView: (UIPickerView *) pickerView widthForComponent: (NSInteger) component
{
    if (component == kAnimalComponent) {
        return 150.0;
    } else {
        return 150.0;
    }
}

- (void) pickerView: (UIPickerView *) pickerView didSelectRow: (NSInteger) row inComponent: (NSInteger) component
{
    ViewController *initialView = (ViewController *)self.delegate;
    if (component == kAnimalComponent) {
        int chosenSound = [pickerView selectedRowInComponent: kSoundComponent];
        [initialView displayAnimal: [self.animalNames objectAtIndex: row] withSound:[self.animalSounds objectAtIndex: chosenSound] fromComponent: @"the Animal"];
    } else {
        int chosenAnimal = [pickerView selectedRowInComponent: kAnimalComponent];
        [initialView displayAnimal: [self.animalNames objectAtIndex: chosenAnimal] withSound:[self.animalSounds objectAtIndex: row] fromComponent: @"the Sound"];
    }
}

@end
