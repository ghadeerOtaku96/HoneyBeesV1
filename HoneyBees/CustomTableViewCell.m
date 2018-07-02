//
//  CustomTableViewCell.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 6/13/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.OnlineActivity.layer.cornerRadius = self.OnlineActivity.frame.size.width/2;
    self.OnlineActivity.clipsToBounds = YES;
    self.OnlineActivity.layer.borderColor = [UIColor whiteColor].CGColor;
    self.OnlineActivity.layer.borderWidth =1.0 ;
    
  
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
