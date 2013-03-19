//
//  ViewController.m
//  TableViewTest
//
//  Created by zheng libao on 12-10-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *tableName;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tableName = [NSMutableArray arrayWithObjects:@"a", @"b", @"c", nil];
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
    return ([tableName count]);
}

- (UITableViewCell *) tableView: (UITableView *) tableView 
          cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
    NSString *simpleTableIdentifer = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: simpleTableIdentifer];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifer];
    }
    
    cell.textLabel.text = [tableName objectAtIndex: indexPath.row];
    
    return (cell);
}

- (void) tableView: (UITableView *) tableView 
commitEditingStyle: (UITableViewCellEditingStyle) editingStyle 
forRowAtIndexPath: (NSIndexPath *) indexPath
{
    [tableName removeObjectAtIndex: indexPath.row];
    
    [tableView reloadData];
}

@end
