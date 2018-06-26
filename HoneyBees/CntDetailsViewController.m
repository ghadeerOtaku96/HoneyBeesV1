//
//  CntDetailsViewController.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 6/25/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "CntDetailsViewController.h"

@interface CntDetailsViewController ()

@end

@implementation CntDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

       [[ServicesManager sharedInstance].contactsManagerService fetchRemoteContactDetail:self.contact];
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didGetInfo:) name:kContactsManagerServiceDidChangeContactDisplayUserSettings object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    dispatch_sync(dispatch_get_main_queue(), ^{
        
        UIImage* img = [UIImage imageWithData:self.contact.photoData];
        self.ContactImage.image = img;
        self.ContactImage.layer.cornerRadius = self.ContactImage.frame.size.width/2;
        self.ContactImage.layer.masksToBounds = true;
   
        self.ContactDetails.text = self.contact.fullName ;
        
        
    
    });
}

-(void)didGetInfo:(NSNotification*) notification{
    NSLog(@"GET INFO");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
