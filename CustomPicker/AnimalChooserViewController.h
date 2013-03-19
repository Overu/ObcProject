//
//  AnimalChooserViewController.h
//  CustomPicker
//
//  Created by zheng libao on 13-3-17.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AnimalChooserViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) id delegate;
@property (strong, nonatomic) NSArray *animalNames;
@property (strong, nonatomic) NSArray *animalSounds;
@property (strong, nonatomic) NSArray *animalImages;

@end
