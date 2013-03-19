//
//  RecipeBookViewController.m
//  RecipeBook
//
//  Created by Rickie Li on 12-8-14.
//  Copyright (c) 2012年 Rickie Li. All rights reserved.
//

#import "RecipeBookViewController.h"
#import "RecipeDetailViewController.h"

@interface RecipeBookViewController ()

@end

@implementation RecipeBookViewController{
    NSArray *recipes;
    NSArray *searchResults;
}

@synthesize theTableView;

#pragma mark search filter
-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchText];

    searchResults = [recipes filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:nil];
    
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.searchDisplayController.searchResultsTableView)
    {
        [self performSegueWithIdentifier:@"showRecipeDetail" sender:self];
    }
}

#pragma  mark -

#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Initialize table data
     recipes = [NSArray arrayWithObjects:@"全聚德烤鸭", @"鱼香肉丝", @"老北京炖豆腐",@"扬州炒饭",@"青  菜",@"宫保鸡丁",@"宫保鱼片",@"西红柿蛋汤",@"土豆丝",@"剁椒鱼头",@"鱼块粉条",@"鱼香茄子煲",@"牛肉粉丝",@"南翔小笼",@"过桥米线",@"热干面",@"葱香鲫鱼", nil];
}
#pragma mark -

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [searchResults count];
    }
    
    return [recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    // Returns a reusable table-view cell object located by its identifier.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if(tableView == self.searchDisplayController.searchResultsTableView)
    {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showRecipeDetail"]){
        NSIndexPath *indexPath = nil;
        RecipeDetailViewController *destViewController = segue.destinationViewController;
        
        if([self.searchDisplayController isActive])
        {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            destViewController.recipeName = [searchResults objectAtIndex:indexPath.row];
        }
        else
        {
            indexPath = [self.theTableView indexPathForSelectedRow];
            destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
        }
    }
}
@end
