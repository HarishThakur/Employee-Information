//
//  CustomTableViewCell.m
//  Employee Information
//
//  Created by Harish Singh on 05/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"dark-wood-image.jpg"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
