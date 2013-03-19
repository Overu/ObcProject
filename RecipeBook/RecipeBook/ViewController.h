//
//  ViewController.h
//  RecipeBook
//
//  Created by zheng libao on 12-10-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>

@property(nonatomic, strong) IBOutlet UITableView *tableView;

//- (void) filterContentForSearchText: (NSString *) searchText 
//                              scope: (NSString *) scope;

@end
