//
//  ChatViewController.h
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 7/2/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *chattingTable;
@property (strong, nonatomic) IBOutlet UIView *messageFieldView;
@property (strong, nonatomic) IBOutlet UITextField *chatText;
@property (strong, nonatomic) IBOutlet UIButton *sendButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;



@end
