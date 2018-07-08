//
//  ContactTableViewCell.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 6/24/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "ContactTableViewCell.h"
#import "CntDetailsViewController.h"
#import <Rainbow/Rainbow.h>
@implementation ContactTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //self.NameLabel.text = self.contact.fullName;
    
    self.OnlineActivity.layer.cornerRadius = self.OnlineActivity.frame.size.width/2;
    self.OnlineActivity.clipsToBounds = YES;
    self.OnlineActivity.layer.borderColor = [UIColor whiteColor].CGColor;
    self.OnlineActivity.layer.borderWidth = 3 ;
    [self.OnlineActivity bringSubviewToFront:self.imageView];
//    UIImage* ProfilePic = [UIImage imageWithData:self.contact.photoData];
//    self.imageView.image = ProfilePic;
//    self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2;
//    self.imageView.layer.masksToBounds = true;
    
//    switch (self.contact.presence.presence) {
//                    case 0:
//                        self.OnlineActivity.backgroundColor = [UIColor grayColor];
//                        self.StatusLabel.text = @"Offline";
//                        break;
//                    case 1:
//                        self.OnlineActivity.backgroundColor = [UIColor greenColor];
//                        self.StatusLabel.text = @"Online";
//                        break;
//                    case 2:
//                        self.OnlineActivity.backgroundColor = [UIColor redColor];
//                        self.StatusLabel.text = @"Don't distrub";
//                        break;
//                    case 3:
//                        self.OnlineActivity.backgroundColor = [UIColor blueColor];
//                        self.StatusLabel.text = @"Busy";
//                        break;
//                    case 4:
//                        self.OnlineActivity.backgroundColor = [UIColor orangeColor];
//                        self.StatusLabel.text = @"Away";
//                        break;
//                    case 5:
//                        self.StatusLabel.text = @"Invisible";
//                    default:
//                        self.OnlineActivity.backgroundColor = [UIColor grayColor];
//                        self.StatusLabel.text = @"Offline";
//                        break;
//                }

//    if(self.contact.isRainbowUser) {
//        
//                [self.DetailsButton setTitle:@"" forState:UIControlStateNormal];
//                [self.DetailsButton setImage:[UIImage imageNamed:@"contacts_details.png"] forState:UIControlStateNormal];
//        
//            }
//            if (!self.contact.isInRoster && !self.contact.isRainbowUser && self.contact.sentInvitation.direction !=2){
//                //[cell.DetailsButton setTitle:@"Invite+" forState:UIControlStateNormal];
//                [self.DetailsButton setImage:[UIImage imageNamed:@"invite.png"] forState:UIControlStateNormal];
//                [self.DetailsButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//
//            }
//            if(!self.contact.isInRoster && !self.contact.isRainbowUser && self.contact.sentInvitation.direction ==2){
//                [self.DetailsButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//                [self.DetailsButton setTitle:@"Sent" forState:UIControlStateNormal];
//
//            }
//    

                          
 }

-(void)setCellContact:(Contact *)cnt{
    self.contact = cnt;
}

- (IBAction)showDetails:(UIButton *)sender {
   
    if(self.contact.isInRoster){
        
            UIStoryboard* st = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            CntDetailsViewController* nextVC = (CntDetailsViewController *)[st instantiateViewControllerWithIdentifier:@"CntD"];
            nextVC.contact = self.contact;
        
        
            [self.ContactVC.navigationController pushViewController:nextVC animated:YES];
        
    }
    
    
    if (!self.contact.isInRoster && !self.contact.isRainbowUser && self.contact.sentInvitation.direction !=2){
    
        [[NSNotificationCenter defaultCenter]addObserver:self.ContactVC selector:@selector(didInviteContact:) name:kContactsManagerServiceDidInviteContact object:nil];
       
        UIImage* sent = [UIImage imageNamed:@"sent.png"];
        [sender setImage:sent forState:UIControlStateNormal];
        sender.enabled = NO;
        NSString * name = self.contact.fullName;
       
    }
    
    
    if (!self.contact.isInRoster && !self.contact.isRainbowUser && self.contact.sentInvitation.direction ==2){
        sender.enabled = false;
    }

    
}
-(void)didInviteContact:(NSNotification*)notification{
    NSLog(@"INVITE CONTACT");
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
