//
//  ViewController.h
//  FlowerColorTable
//
//  Created by zheng libao on 13-3-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *redFlowers;
@property (strong, nonatomic) NSArray *blueFlowers;

@end
