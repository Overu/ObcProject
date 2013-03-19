//
//  RecipeDetailViewController.h
//  RecipeBook
//
//  Created by Rickie Li on 12-8-15.
//  Copyright (c) 2012年 EntLib.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeName;

@end
