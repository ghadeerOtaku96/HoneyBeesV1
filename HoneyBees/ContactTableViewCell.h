//
//  ContactTableViewCell.h
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 6/24/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rainbow/Rainbow.h>
#import "ContactsViewController.h"
@interface ContactTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) IBOutlet UILabel *NameLabel;
@property (strong, nonatomic) IBOutlet UILabel *StatusLabel;
@property (strong, nonatomic) IBOutlet UIButton *DetailsButton;
@property (strong, nonatomic) IBOutlet UILabel *OnlineActivity;

@property (strong, nonatomic) Contact *contact;
@property (strong, nonatomic) ContactsViewController *ContactVC;

- (IBAction)showDetails:(UIButton *)sender;

@end
