//
//  KPViewController.h
//  Sample
//
//  Created by Grantland Chew on 9/19/12.
//  Copyright (c) 2012 Kiip, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SampleViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *aliasField;
@property (strong, nonatomic) IBOutlet UITextField *genderField;
@property (strong, nonatomic) IBOutlet UITextField *birthdayField;
@property (strong, nonatomic) IBOutlet UIButton *saveUserInfo;

@property (strong, nonatomic) IBOutlet UITextField *momentField;
@property (strong, nonatomic) IBOutlet UIButton *saveMoment;

@property (strong, nonatomic) IBOutlet UILabel *deviceLabel;

@end
