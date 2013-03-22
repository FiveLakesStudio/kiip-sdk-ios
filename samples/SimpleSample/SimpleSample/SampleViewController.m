//
//  KPViewController.m
//  Sample
//
//  Created by Grantland Chew on 9/19/12.
//  Copyright (c) 2012 Kiip, Inc. All rights reserved.
//

#import <KiipSDK/KiipSDK.h>

#import "SampleViewController.h"

@interface SampleViewController () <UITextFieldDelegate>

@end

@implementation SampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.deviceLabel setText:[NSString stringWithFormat:@"Device ID: %@", [[Kiip sharedInstance] deviceIdentifier]]];

    self.emailField.delegate = self;
    self.aliasField.delegate = self;
    self.genderField.delegate = self;
//    self.birthdayField.delegate = self;
    [self.saveUserInfo addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];

    self.momentField.delegate = self;
    [self.saveMoment addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)onClick:(id)sender {
    // Save User Info
    if ([sender isEqual:self.saveUserInfo]) {
        Kiip *kiip = [Kiip sharedInstance];

        kiip.email = self.emailField.text;
        kiip.alias = self.aliasField.text;
        kiip.gender = self.genderField.text;
//        kiip.birthday = self.birthdayField.text;
    }

    // Save Moment
    else if ([sender isEqual:self.saveMoment]) {
        NSString *momentId = self.momentField.text;
        [[Kiip sharedInstance] saveMoment:momentId withCompletionHandler:^(KPPoptart *poptart, NSError *error) {
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
            }

            // Since we've implemented this block, Kiip will no longer show the poptart automatically
            [poptart show];
        }];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (self.emailField == textField) {
//        [self.emailField resignFirstResponder];
        [self.aliasField becomeFirstResponder];
    }
    else if (self.aliasField == textField) {
        [self.genderField becomeFirstResponder];
    }
    else if (self.genderField == textField
             || self.momentField == textField) {
        [textField resignFirstResponder];
    }

    return NO;
}

@end
