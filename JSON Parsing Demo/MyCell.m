//
//  MyCell.m
//  JSON Parsing Demo
//
//  Created by Suniket Wagh on 06/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell
@synthesize myImage,nameLabel;

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
