//
//  AppController.h
//  AppController
//
//  Created by zheng libao on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject
{
    IBOutlet NSTextField *textField;
    IBOutlet NSTextField *resourField;
}

- (IBAction) uppercase: (id) sender;
- (IBAction) lowercase: (id) sender;

@end
