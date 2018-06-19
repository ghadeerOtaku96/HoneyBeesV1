//
//  ConversatoinsViewController.h
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 6/6/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rainbow/Rainbow.h>
#import "CustomTableViewCell.h"

@interface ConversatoinsViewController : UIViewController <UISearchBarDelegate>
@property (strong ,nonatomic) NSArray<Conversation *> *conversationsArray ;
@property (strong, nonatomic) IBOutlet UITableView *ConversationTable;





@end
