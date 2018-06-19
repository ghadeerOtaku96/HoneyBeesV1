//
//  LoginViewController.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 5/29/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "LoginViewController.h"
#import <Rainbow/Rainbow.h>
#import <FCAlertView/FCAlertView.h>
#import "ConversationTabsViewController.h"
#import "myViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark - Application LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.DEfaultStore = [NSUserDefaults standardUserDefaults];
    self.email.delegate = self;
    self.password.delegate = self;
    self.loader.hidden = YES;
    self.scroll.scrollEnabled = NO;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self registerForKeyboard];//add keyboard notifications to scroll up the view
    [self.email  resignFirstResponder];
    [self.password  resignFirstResponder];
    self.email.text = @"geaghadeer.15aboalrob@gmail.com";
    self.password.text = @"@Subarashii114";
// add the login notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didLogin:) name:kLoginManagerDidLoginSucceeded object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFailedToLogin:) name:kLoginManagerDidFailedToAuthenticate object:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self deregisterFromKeyboard]; //remove keyboard notifications to reset the view
    
    [super viewWillDisappear:animated];

    [[NSNotificationCenter defaultCenter] removeObserver:kLoginManagerDidLoginSucceeded];
    [[NSNotificationCenter defaultCenter] removeObserver:kLoginManagerDidFailedToAuthenticate];
    
    

    
}

#pragma mark - Keyboard Notifications
- (void)registerForKeyboard {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}
- (void)deregisterFromKeyboard {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

// any touch outside the text fields will be ignored and disable the keyboard
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    [self deregisterFromKeyboard];
    
}



#pragma mark - Keyboard movement
//scroll up the view when the keyboard is being used
- (void)keyboardWasShown:(NSNotification *)notification {
    
    NSDictionary* info = [notification userInfo];
    
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGPoint buttonOrigin = self.createButton.frame.origin;
    
    CGFloat buttonHeight = self.createButton.frame.size.height;
    
    CGRect visibleRect = self.view.frame;
    
    visibleRect.size.height -= keyboardSize.height;
    
    if (!CGRectContainsPoint(visibleRect, buttonOrigin)){
        
        CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
        
        [self.scroll setContentOffset:scrollPoint animated:YES];
        
    }
    
}
//reset the view when the keyboard is being hidden
- (void)keyboardWillBeHidden:(NSNotification *)notification {
    
    [self.scroll setContentOffset:CGPointZero animated:YES];
    
}

#pragma - mark NEXT_DONE button
//process NEXT and DONE button on keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
   if(textField == self.email)
      [self.password becomeFirstResponder];
   if(textField == self.password)
       [self.password resignFirstResponder];
    
    return YES;
    
}


#pragma - mark event handling
//handling buttons in view
- (IBAction)forgetPassword:(UIButton *)sender {
}

- (IBAction)login:(UIButton *)sender {
// some animations when the login button is pressed
    do{
    dispatch_async(dispatch_get_main_queue(), ^{
       
        [sender setTitle:@"" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5             
                         animations:^{
                             sender.frame = CGRectMake(sender.frame.origin.x + sender.frame.size.width*3/8,sender.frame.origin.y,sender.frame.size.width/4,sender.frame.size.height);
                             sender.layer.cornerRadius = 18.0;
                             sender.layer.masksToBounds = YES;}];
        
        [self.loader setHidden:NO];
        [self.loader startAnimating];
    });}while(0);

// login stratigy
    
    [self.DEfaultStore setObject:self.email.text forKey:@"Email"];
    [self.DEfaultStore setObject:self.password.text forKey:@"Password"];
    [self.DEfaultStore synchronize];
    [[ServicesManager sharedInstance].loginManager setUsername:self.email.text andPassword:self.password.text];
    [[ServicesManager sharedInstance].loginManager connect];

}




//what to do when the login succeeded
-(void) didLogin:(NSNotification *) notification { NSLog(@"DID LOGIN");
// stop the Activity Indicator
        dispatch_async(dispatch_get_main_queue(), ^{
    [self.loader stopAnimating];});
// go to the next ViewController

    UIStoryboard* st = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ConversationTabsViewController* nextVC = (ConversationTabsViewController *)[st instantiateViewControllerWithIdentifier:@"nextVC"];
    [self presentViewController:nextVC animated:YES completion:nil];
    
}


// what to do when the login failed
-(void) didFailedToLogin:(NSNotificationCenter *)notification{ NSLog(@"FAILED TO LOGIN");
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.loader stopAnimating];
        self.loader.hidden = YES;
        [self.password resignFirstResponder];

// view a custom alert from cocoapods
        UIImage *img = [UIImage imageNamed:@"icon-32"];// img for alert
        FCAlertView* alert = [[FCAlertView alloc]init];
// customization
        alert.avoidCustomImageTint = YES;
        alert.customImageScale = 1.5;
        alert.hideDoneButton = YES;
        alert.cornerRadius = 10;
        alert.blurBackground = YES;
        alert.animateAlertOutToTop = YES;

//showing alert
        [alert showAlertInView:self
                     withTitle:@"Login failed"
                  withSubtitle:@"There is wrong on your entered data , please try again."
               withCustomImage:img
           withDoneButtonTitle:nil
                    andButtons:nil];
// adding button with action
        [alert addButton:@"OK" withActionBlock:^{
            //Handle your OK button action here
            
            self.password.text = @"";
            [self registerForKeyboard];
            [self.password becomeFirstResponder];
            
            self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x - self.loginButton.frame.size.width*1.5,self.loginButton.frame.origin.y,self.loginButton.frame.size.width*4,self.loginButton.frame.size.height);
            self.loginButton.layer.cornerRadius = 5.0;
            self.loginButton.layer.masksToBounds = YES;
            [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
        }];
        
    
    });
    

}

- (IBAction)createAccount:(UIButton *)sender {
    
}



@end
