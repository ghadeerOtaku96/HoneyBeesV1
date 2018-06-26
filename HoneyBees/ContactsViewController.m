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
#import "CntDetailsViewController.h"
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
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [cell.OnlineActivity bringSubviewToFront:cell.imageView];
        UIImage* ProfilePic =[UIImage imageWithData:contact.photoData];
        //UIImage* ProfilePic = [UIImage imageNamed:@"ew.jpg"];
        //cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        cell.imageView.image = ProfilePic;
        cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width/2;
        cell.imageView.layer.masksToBounds = true;
    });
    

    
    
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
            cell.OnlineActivity.backgroundColor = [UIColor blueColor];
            cell.StatusLabel.text = @"Busy";
            break;
        case 4:
            cell.OnlineActivity.backgroundColor = [UIColor orangeColor];
            cell.StatusLabel.text = @"Away";
            break;
        case 5:
            cell.StatusLabel.text = @"Invisible";
        default:
            cell.OnlineActivity.backgroundColor = [UIColor grayColor];
            cell.StatusLabel.text = @"Offline";
            break;
    }
    
    if(contact.isRainbowUser) {
           
        //[cell.DetailsButton setTitle:@"" forState:UIControlStateNormal];
        [cell.DetailsButton setImage:[UIImage imageNamed:@"contacts_details.png"] forState:UIControlStateNormal];
        cell.DetailsButton.contentMode = UIViewContentModeScaleAspectFit;
        cell.DetailsButton.enabled = YES;
        if(cell.DetailsButton.isSelected){
            [cell.DetailsButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
            cell.DetailsButton.tag = indexPath.row;
            
        }
    }
    if (!contact.isInRoster && !contact.isRainbowUser && contact.sentInvitation.direction !=2){
        //[cell.DetailsButton setTitle:@"Invite+" forState:UIControlStateNormal];
        [cell.DetailsButton setImage:[UIImage imageNamed:@"invite.png"] forState:UIControlStateNormal];
        cell.DetailsButton.contentMode = UIViewContentModeScaleAspectFit;
        [cell.DetailsButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        cell.DetailsButton.enabled = YES;
    }
    if(!contact.isInRoster && !contact.isRainbowUser && contact.sentInvitation.direction ==2){
        [cell.DetailsButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [cell.DetailsButton setTitle:@"Sent" forState:UIControlStateNormal];
        cell.DetailsButton.enabled = NO;
    }

    
 
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 68;}
//////////////////////////////////////////////////////
-(void)showDetails:(id)sender{
    dispatch_async(dispatch_get_main_queue(), ^{
    UIStoryboard* st = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    CntDetailsViewController* nextVC = (CntDetailsViewController *)[st instantiateViewControllerWithIdentifier:@"CntD"];

    Contact* cnt = [self.ContactsArray objectAtIndex:[sender tag]];
    nextVC.contact = cnt;
        
    [self presentViewController:nextVC animated:YES completion:nil];
    });
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
