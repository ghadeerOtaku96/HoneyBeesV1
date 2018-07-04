//
//  ChatViewController.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 7/2/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatTableViewCell.h"
#import <Rainbow/Rainbow.h>
@interface ChatViewController ()<UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate>

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.chatText.delegate = self;
//    [self.chatText resignFirstResponder];
    self.chattingTable.delegate = self;
    self.chattingTable.dataSource = self;
    self.chattingTable.allowsSelection = NO;
    self.chattingTable.estimatedRowHeight = 68;
    self.chattingTable.rowHeight = UITableViewAutomaticDimension;
    
    self.chattingTable.separatorColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - UITextField Delegate methods
//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//   
//    [self.view layoutIfNeeded];
//    [UIView animateWithDuration:0.5 animations:^{
//        self.msgViewHeightConstraint.constant = -200;
//        [self.view layoutIfNeeded];
//    } completion:nil];
//    
//}
//-(void)textFieldDidEndEditing:(UITextField *)textField{
//    
//    [self.view layoutIfNeeded];
//    [UIView animateWithDuration:0.5 animations:^{
//        self.msgViewHeightConstraint.constant = -77;
//        [self.view layoutIfNeeded];
//    } completion:nil];
//}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;//self.ContactsArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.chattingTable deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChatTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"chatCell"];
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"ChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"chatCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"chatCell"];
    }
    cell.nameLabel.text = @"alaa";
    cell.messageBody.text = @"Hellolwkrijgkerkjghkjdfsghlkjdfhkdjfgljdflkfgdkfjghdkjfhgkdfjhgkdjfhgdkfjjldsknfubekjfjpslmddjuunpsknjdufhijdnsbhfowkmndhfns,dmlkjops;omsjkd;a[jsndmnlsd]jdnskdjfl;so]dfkskj";


    dispatch_async(dispatch_get_main_queue(), ^{
        cell.avatar.layer.cornerRadius = cell.avatar.frame.size.width/2;
        cell.avatar.layer.masksToBounds = YES;
        CGRect frame = cell.messageBody.frame;
        frame.size.height = cell.messageBody.contentSize.height;
        frame.size.width = cell.messageBody.contentSize.width;
        cell.messageBody.frame = frame;
    });
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 68;}

- (IBAction)sendMessage:(UIButton *)sender {
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
