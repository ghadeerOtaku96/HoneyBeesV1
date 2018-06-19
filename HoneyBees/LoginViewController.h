//
//  LoginViewController.h
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 5/29/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIView *LoginWindow;

@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *forgetButton;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@property (strong, nonatomic) NSUserDefaults* DEfaultStore;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@property (strong, nonatomic) IBOutlet UIButton *createButton;

@property (strong, nonatomic) IBOutlet UIScrollView *scroll;


- (IBAction)forgetPassword:(UIButton *)sender;

- (IBAction)login:(UIButton *)sender;
- (IBAction)createAccount:(UIButton *)sender;

@end
