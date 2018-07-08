//
//  ConversationViewController.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 7/1/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "ConversationViewController.h"
#import "CustomTableViewCell.h"

@interface ConversationViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (strong ,nonatomic) NSMutableArray<Conversation *> *conversationsArray ;
@end

@implementation ConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray* array = [ServicesManager sharedInstance].conversationsManagerService.conversations;
    self.conversationsArray = [NSMutableArray arrayWithArray:array];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didAddConversation:) name:kConversationsManagerDidAddConversation object:nil];


    self.ConversationsTable.delegate = self;
    self.ConversationsTable.dataSource = self;
    self.ConversationsTable.allowsSelection = NO;
    self.ConversationsTable.separatorColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}


-(void)didAddConversation:(NSNotification*)notification{
    dispatch_async(dispatch_get_main_queue(), ^{
        Conversation * conversation = (Conversation *)notification.object;
        [self.conversationsArray addObject:conversation];
        [self.ConversationsTable reloadData];
 
    });
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"test2 %lu",(unsigned long)self.conversationsArray.count);
    return self.conversationsArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.ConversationsTable deselectRowAtIndexPath:indexPath animated:YES];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CustomTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"convcell"];
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"convcell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"convcell"];
    }
    
    Conversation * conversation = (Conversation *)  [self.conversationsArray objectAtIndex:indexPath.row];
    dispatch_async(dispatch_get_main_queue(), ^{
    if ([conversation.peer isKindOfClass:[Contact class]]) {
        Contact * aContact = (Contact *)conversation.peer;
        cell.NameLabel.text = aContact.fullName ;
        cell.imageView.image = [UIImage imageWithData:aContact.photoData];
    }
    if ([conversation.peer isKindOfClass:[Room class]]) {
        Room* aRoom = (Room *)conversation.peer;
        cell.NameLabel.text = aRoom.displayName;
        cell.imageView.image = [UIImage imageWithData:aRoom.creator.photoData];
    }
    
    cell.StatusLabel.text = conversation.lastMessage.body;
    cell.DateLabel.text = [NSString stringWithFormat:@"%@",conversation.lastUpdateDate];
    


        cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width/2;
        cell.imageView.clipsToBounds = YES;
        
//        cell.OnlineActivity.layer.cornerRadius = cell.OnlineActivity.frame.size.width/2;
//        cell.OnlineActivity.clipsToBounds = YES;
//        cell.OnlineActivity.layer.borderColor = [UIColor whiteColor].CGColor;
//        cell.OnlineActivity.layer.borderWidth =2.0 ;
        
        
    });
  [cell.OnlineActivity bringSubviewToFront:cell.imageView];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
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
