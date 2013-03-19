//
//  SimpleTableCellCell.m
//  SimpleApp
//
//  Created by zheng libao on 12-10-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SimpleTableCellCell.h"

@implementation SimpleTableCellCell

@synthesize nameLabel = _nameLabel;
@synthesize prpeTimeLable = _prpeTimeLable;
@synthesize thumbnailImageView = _thumbnailImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
