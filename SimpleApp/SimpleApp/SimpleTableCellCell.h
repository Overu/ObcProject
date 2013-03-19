//
//  SimpleTableCellCell.h
//  SimpleApp
//
//  Created by zheng libao on 12-10-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCellCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prpeTimeLable;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
