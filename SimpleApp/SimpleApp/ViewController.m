//
//  ViewController.m
//  SimpleApp
//
//  Created by zheng libao on 12-10-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTableCellCell.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *tableData;
    NSArray *thumbnails;
    NSArray *prepTime;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource: @"recipes" ofType: @"plist"];
    
    NSDictionary *dictionary = [[NSDictionary alloc]initWithContentsOfFile: path];
    
    tableData = [dictionary objectForKey: @"RecipesName"];
    thumbnails = [dictionary objectForKey: @"Thumbnail"];
    prepTime = [dictionary objectForKey: @"PrepTime"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger) tableView: (UITableView *) tableView
  numberOfRowsInSection: (NSInteger) section
{
    return ([tableData count]);
}

- (UITableViewCell *) tableView: (UITableView *) tableView
          cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
    static NSString *simpleTableIdentifier = @"SmpleTableItem";
    
    SimpleTableCellCell *cell = (SimpleTableCellCell *)[tableView dequeueReusableCellWithIdentifier: simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed: @"SimpleTableCell" owner: self options:nil];
        cell = [nib objectAtIndex: 0];
    }
    
    cell.nameLabel.text = [tableData objectAtIndex: indexPath.row];
    
    NSInteger index = indexPath.row < [thumbnails count] ? indexPath.row : [thumbnails count] - 1;
    
    cell.thumbnailImageView.image = [UIImage imageNamed: [thumbnails objectAtIndex: index]];
    
    index = indexPath.row < [prepTime count] ? indexPath.row : [prepTime count] - 1;
    cell.prpeTimeLable.text = [prepTime objectAtIndex: index];
    
    return (cell);
}

- (CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath: (NSIndexPath *) indexPath
{
    return (78);
}

- (void) tableView: (UITableView *) tableView
didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    //UIAlertView *message = [[UIAlertView alloc] initWithTitle: @"select index" message: @"you selection index" delegate: nil cancelButtonTitle: @"ok" otherButtonTitles: nil];
    
    //[message show];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
}

- (NSIndexPath *) tableView: (UITableView *) tableView
willDeselectRowAtIndexPath: (NSIndexPath *) indexPath
{
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    return (indexPath);
}

- (void) tableView: (UITableView *) tableView 
commitEditingStyle: (UITableViewCellEditingStyle) editingStyle 
 forRowAtIndexPath: (NSIndexPath *) indexPath
{
    NSLog(@"%@", editingStyle);
}

@end
