//
//  ConversationViewController.h
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 7/1/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rainbow/Rainbow.h>
#import "CustomTableViewCell.h"
@interface ConversationViewController : UIViewController
@property (strong ,nonatomic) NSMutableArray<Conversation *> *conversationsArray ;
@property (strong, nonatomic) IBOutlet UITableView *ConversationTable;

@end
