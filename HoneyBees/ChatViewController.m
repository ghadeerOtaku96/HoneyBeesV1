//
//  ChatViewController.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 7/2/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "ChatViewController.h"

#import "OutgoingTableViewCell.h"
#import <Rainbow/Rainbow.h>
@interface ChatViewController ()<UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate>

@property (nonatomic) float cellHeight;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.chatText.delegate = self;

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
    OutgoingTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"sentCell"];
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"OutgoingTableViewCell" bundle:nil] forCellReuseIdentifier:@"sentCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"sentCell"];
    }
    cell.layer.cornerRadius = 15;
    cell.clipsToBounds = YES;
      cell.messageBody.text = @"Hellolwkrijgkerkjghkjdfsghlkjdfhkdjfgljdflkfgdkfjghdkjfhgkdfjhgkdjfhgdkfjjldsknfubekjfjpslmddjuunpsknjdufhijdnsbhfowkmndhfns,dmlkjops;omsjkd;a[jsndmnlsd]jdnskdjfl;so]dfkskj";
    NSString* str = @"Hellolwkrijgkerkjghkjdfsghlkjdfhkdjfgljdflkfgdkfjghdkjfhgkdfjhgkdjfhgdkfjjldsknfubekjfjpslmddjuunpsknjdufhijdnsbhfowkmndhfns,dmlkjops;omsjkd;a[jsndmnlsd]jdnskdjfl;so]dfkskj";
    cell.messageBody.lineBreakMode = NSLineBreakByTruncatingTail;
    cell.messageBody.numberOfLines=0;
    

    cell.msgDate.text = @"2-03-18";
    
    /* Check Content Size and Set Height */
//    CGRect msgFrame = [cell.messageBody.text boundingRectWithSize:CGSizeMake(240.f, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:[UIFont fontWithName:@"" size:14.0f]} context:nil];
//   
//   self.requiredSize = msgFrame.size;
//CGSize textSize = [[str getALongText]
//                       sizeWithFont:[UIFont boldSystemFontOfSize:15]
//                       constrainedToSize:CGSizeMake(maxWidth, 2000)
//                       lineBreakMode:UILineBreakModeWordWrap];
    self.cellHeight = cell.messageBody.frame.size.height + cell.msgDate.frame.size.height ;



    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150 ;
}
//- (CGFloat):(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return self.cellHeight;
//}

- (IBAction)sendMessage:(UIButton *)sender {
}
- (IBAction)back:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
