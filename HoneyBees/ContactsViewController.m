//
//  ContactsViewController.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 6/24/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "ContactsViewController.h"
#import <Rainbow/Rainbow.h>
#import "ContactTableViewCell.h"
@interface ContactsViewController () <UITableViewDelegate , UITableViewDataSource>

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.ContactsArray = [ServicesManager sharedInstance].contactsManagerService.contacts;
    [[ServicesManager sharedInstance].contactsManagerService requestAddressBookAccess];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didAddContact:) name:kContactsManagerServiceDidAddContact object:nil];
    self.ContactsTable.allowsSelection = NO;
    self.ContactsTable.delegate = self;
    self.ContactsTable.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)didAddContact:(NSNotification*)notification{
    Contact *contact = (Contact *)notification.object;
    [self.ContactsArray addObject:contact];
    NSLog(@"CONTACT");
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ContactsArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.ContactsTable deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"ContactTableViewCell" bundle:nil] forCellReuseIdentifier:@"mycell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    }
    
    Contact * contact = (Contact *)  [self.ContactsArray objectAtIndex:indexPath.row];
    cell.NameLabel.text = contact.fullName;
    cell.StatusLabel.text = contact.presence.status;
  
    switch (contact.presence.presence) {
        case 0:
            cell.OnlineActivity.backgroundColor = [UIColor grayColor];
            cell.StatusLabel.text = @"Offline";
            break;
        case 1:
            cell.OnlineActivity.backgroundColor = [UIColor greenColor];
            cell.StatusLabel.text = @"Online";
            break;
        case 2:
            cell.OnlineActivity.backgroundColor = [UIColor redColor];
            cell.StatusLabel.text = @"Don't distrub";
            break;
        case 3:
            cell.StatusLabel.text = @"Busy";
            break;
        case 4:
            cell.OnlineActivity.backgroundColor = [UIColor orangeColor];
            break;
        case 5:
            cell.StatusLabel.text = @"Invisible";
        default:
            break;
    }
    
   
    if (!contact.isInRoster && !contact.isRainbowUser && contact.sentInvitation.direction !=2){
        [cell.DetailsButton setTitle:@"Invite+" forState:UIControlStateNormal];
        [cell.DetailsButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    else if(!contact.isInRoster && !contact.isRainbowUser && contact.sentInvitation.direction ==2){
        [cell.DetailsButton setTitle:@"Sent" forState:UIControlStateNormal];
        [cell.DetailsButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    else {
      
        [cell.DetailsButton setTitle:@"" forState:UIControlStateNormal];
           // UIImage* CDetails = [[UIImage alloc]initWithContentsOfFile:@"contact_details.png"];
          //  [cell.DetailsButton setBackgroundImage:CDetails forState:UIControlStateNormal];
        [cell.DetailsButton setImage:[UIImage imageNamed:@"contact_details.png"] forState:UIControlStateNormal];
        
    }
        
    //UIImage* ProfilePic =[UIImage imageWithData:contact.photoData];
    //cell.imageView.image = ProfilePic;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   return 70;}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
