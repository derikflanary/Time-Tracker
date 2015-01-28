//
//  CustomTableViewCell.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/28/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell Two"];
    self.textLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:10];
    self.detailTextLabel.font = [UIFont boldSystemFontOfSize:11];
   
    
    
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
