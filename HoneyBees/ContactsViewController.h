//
//  ContactsViewController.h
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 6/24/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rainbow/Rainbow.h>
@interface ContactsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *ContactsTable;
@property (strong ,nonatomic) NSMutableArray<Contact*> *ContactsArray ;
@end
