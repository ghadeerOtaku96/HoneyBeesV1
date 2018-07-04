//
//  ChatTableViewCell.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 7/2/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "ChatTableViewCell.h"

@implementation ChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.messageBody.editable = NO;
    self.messageBody.userInteractionEnabled = NO;
    self.messageBody.layer.cornerRadius = 15;
    self.messageBody.clipsToBounds = YES;
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
