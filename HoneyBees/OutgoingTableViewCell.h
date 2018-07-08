//
//  OutgoingTableViewCell.h
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 7/4/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OutgoingTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *messageBody;
@property (strong, nonatomic) IBOutlet UILabel *msgDate;
@property (strong, nonatomic) IBOutlet UIImageView *status;

@end
