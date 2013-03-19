//
//  SimpleEmailViewController.h
//  RecipeBook
//
//  Created by zheng libao on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface SimpleEmailViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction) showEmail: (id) sender;

@end
