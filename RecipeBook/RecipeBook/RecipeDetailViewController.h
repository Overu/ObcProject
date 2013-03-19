//
//  RecipeDetailViewController.h
//  RecipeBook
//
//  Created by zheng libao on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property(nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property(nonatomic, strong) NSString *recipeName; 

@end
