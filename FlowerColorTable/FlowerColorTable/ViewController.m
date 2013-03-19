//
//  ViewController.m
//  FlowerColorTable
//
//  Created by zheng libao on 13-3-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define kSectionCount 2
#define kRedSection 0
#define kBlueSection 1

@interface ViewController ()

@end

@implementation ViewController

@synthesize redFlowers;
@synthesize blueFlowers;

- (void)viewDidLoad
{
    self.redFlowers = [[NSArray alloc] initWithObjects: @"Gerbera", @"Peony", @"Rose", nil];
    self.blueFlowers = [[NSArray alloc] initWithObjects: @"Hyacinth", @"Hydrangea", nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setRedFlowers: nil];
    [self setBlueFlowers: nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView
{
    return kSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case kRedSection:
            return [self.redFlowers count];
            break;
        case kBlueSection:
            return [self.blueFlowers count];
            break;
            
        default:
            return 0;
    }
}

- (NSString *) tableView: (UITableView *) tableView titleForHeaderInSection: (NSInteger) section
{
    switch (section) {
        case kRedSection:
            return @"Red";
            break;
        case kBlueSection:
            return @"Blue";
            break;
            
        default:
            return @"Unknown";
    }
}
  
- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"flowerCell"];
    
    switch (indexPath.section) {
        case kRedSection:
            cell.textLabel.text = [self.redFlowers objectAtIndex: indexPath.row];
            break;
        case kBlueSection:
            cell.textLabel.text = [self.blueFlowers objectAtIndex: indexPath.row];
            break;
            
        default:
            cell.textLabel.text = @"Unknown";
    }
    
    return cell;
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    UIAlertView *showSelection;
    NSString *flowerMessage;
    
    switch (indexPath.section) {
        case kRedSection:
            flowerMessage = [[NSString alloc] initWithFormat: @"You Chose the red flower - %@", [self.redFlowers objectAtIndex: indexPath.row]];
            break;
        case kBlueSection:
            flowerMessage = [[NSString alloc] initWithFormat: @"You Chose the blue flower - %@", [self.blueFlowers objectAtIndex: indexPath.row]];
            break;
            
        default:
            break;
    }
    
    showSelection = [[UIAlertView alloc] initWithTitle: @"Flower Selection" message: flowerMessage delegate: nil cancelButtonTitle: @"ok" otherButtonTitles: nil];
    [showSelection show];
}

@end
