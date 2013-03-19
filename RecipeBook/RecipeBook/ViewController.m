//
//  ViewController.m
//  RecipeBook
//
//  Created by zheng libao on 12-10-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "RecipeDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *recipes;
    NSArray *searchResults;
}

@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    recipes = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"aa", @"bb", @"cc", @"dd", @"ee", @"ff", @"gg", @"hh", nil];
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
 numberOfRowsInSection: (NSInteger) sectione
{
    if ([self.searchDisplayController isActive]) {
        return ([searchResults count]);
    }
    return ([recipes count]);
}

- (UITableViewCell *) tableView: (UITableView *) tableView 
         cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
    NSString *simpleTableIndentifier = @"RecipeCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier: simpleTableIndentifier];
    
    if (cell  == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIndentifier];
    }
    
    if ([self.searchDisplayController isActive]) {
        cell.textLabel.text = [searchResults objectAtIndex: indexPath.row];
        return (cell);
    }
    
    cell.textLabel.text = [recipes objectAtIndex: indexPath.row];
    
    return (cell);
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue 
                  sender: (id) sender
{
    if ([segue.identifier isEqualToString: @"showRecipeDetail"]) {
        RecipeDetailViewController *destViewController = segue.destinationViewController;
        NSIndexPath *path = nil;
        
        destViewController.hidesBottomBarWhenPushed = YES;
        if ([self.searchDisplayController isActive]) {
            path = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            destViewController.recipeName = [searchResults objectAtIndex:path.row];
            return;
        }
        path = [self.tableView indexPathForSelectedRow];
        destViewController.recipeName = [recipes objectAtIndex:path.row];
    }
}

- (void) filterContentForSearchText: (NSString *) searchText 
                              scope: (NSString *) scope
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"SELF contains[cd] %@",searchText];
    searchResults = [recipes filteredArrayUsingPredicate: predicate]; 
}

//- (void) tableView: (UITableView *) tableView 
//didSelectRowAtIndexPath: (NSIndexPath *) indexPath
//{
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        [self performSegueWithIdentifier: @"showRecipeDetail" sender:self];
//    }
//}

- (BOOL) searchDisplayController: (UISearchDisplayController *) controller 
 shouldReloadTableForSearchString:(NSString *) searchString
{
    [self filterContentForSearchText: searchString scope: [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex: [self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return (YES);
}

@end
