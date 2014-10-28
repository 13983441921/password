//
//  ArthurSetPasswordController.m
//  Password
//
//  Created by lichen on 9/26/14.
//  Copyright (c) 2014 Minicoder. All rights reserved.
//

#import "ArthurSetPasswordController.h"

@interface ArthurSetPasswordController ()

@end

@implementation ArthurSetPasswordController

- (void)viewDidLoad 
{
    [super viewDidLoad];
}

- (IBAction)buttonOfConfirmTouched:(id)sender 
{
    [self resignAllText];
    
    NSString *strPassword = self.textFieldOfPassword.text;
    NSString *strConfirmPassword = self.textFieldOfConfirmPassword.text;
    if (strPassword == nil || [strPassword isEqualToString:@""]) {
        [MNLib showTitle:@"错误" message:@"密码为空" buttonName:@"OK"];
        return;
    }
    if (strConfirmPassword == nil || [strConfirmPassword isEqualToString:@""]) {
        [MNLib showTitle:@"错误" message:@"确认密码为空" buttonName:@"OK"];
        return;
    }
    if (![strPassword isEqualToString:strConfirmPassword]) {
        [MNLib showTitle:@"错误" message:@"密码与确认密码不一致" buttonName:@"OK"];
        return;
    }
    
    [MNLib setValue:strPassword key:kPasswordKey];
    
    [MNLib showTitle:@"设置密码" message:@"成功" delayTime:1.5 completion:^{
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            //to do something.
        }];
    }];
}

#pragma mark
#pragma mark 函数
- (void)resignAllText
{
    [self.textFieldOfPassword resignFirstResponder];
    [self.textFieldOfConfirmPassword resignFirstResponder];
}

- (void)clearText
{
    self.textFieldOfPassword.text = nil;
    self.textFieldOfConfirmPassword.text = nil;
}
@end
