//
//  ChatTableViewCell.h
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 7/2/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *messageBody;
@property (strong, nonatomic) IBOutlet UIImageView *avatar;


@end
