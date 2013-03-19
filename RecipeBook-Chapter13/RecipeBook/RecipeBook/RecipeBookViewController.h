//
//  RecipeBookViewController.h
//  RecipeBook
//
//  Created by Rickie Li on 12-8-14.
//  Copyright (c) 2012年 Rickie Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeBookViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *theTableView;
@end
