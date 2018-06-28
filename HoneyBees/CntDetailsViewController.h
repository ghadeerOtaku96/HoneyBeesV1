//
//  CntDetailsViewController.h
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 6/25/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rainbow/Rainbow.h>
@interface CntDetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *ContactImage;
@property (strong, nonatomic) Contact* contact;
@property (strong, nonatomic) IBOutlet UILabel *InfoLabel;


@end
