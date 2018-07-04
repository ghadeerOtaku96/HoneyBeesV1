//
//  BubblesViewController.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 6/25/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "BubblesViewController.h"
#import "ChatViewController.h"
#import <Rainbow/Rainbow.h>
@interface BubblesViewController ()

@end

@implementation BubblesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.image.layer.cornerRadius = 80;//self.image.frame.size.width/2;
    self.image.layer.masksToBounds = true;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)chat:(UIButton *)sender {

    dispatch_async(dispatch_get_main_queue(), ^{
    UIStoryboard* st = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ChatViewController* nextVC = (ChatViewController *)[st instantiateViewControllerWithIdentifier:@"chatVC"];
        [self presentViewController:nextVC animated:YES completion:nil];});
}


//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    if ([[segue identifier] isEqualToString:@"show"]) {
//        
//        // Get destination view
//        ChatViewController *vc = [segue destinationViewController];
//       
//    }
//}


@end
