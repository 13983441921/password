//
//  ArthurViewController.m
//  Password
//
//  Created by lichen on 6/15/14.
//  Copyright (c) 2014 Minicoder. All rights reserved.
//

#import "ArthurViewController.h"
#import "MNLib.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation ArthurViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        self.bEnableTouchID = YES;
    } else {
        self.bEnableTouchID = NO;
        self.buttonOfUseTouchID.hidden = YES;
    }
    [self registerForUIApplicationWillResignActive];
    
    if ([MNLib getValueByKey:kPasswordKey]) {
        self.bHasSetPassword = YES;
    } else {
        self.bInEnterPasswordView = YES;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    self.bInEnterPasswordView = YES;
    if (![MNLib getValueByKey:kPasswordKey]) {
        [self performSegueWithIdentifier:@"toSetPassword" sender:nil];
        self.bInEnterPasswordView = NO;
    }
}

#pragma mark
#pragma mark 函数: 注册事件
//注册程序失去焦点事件
- (void)registerForUIApplicationWillResignActive
{
    UIApplication *application = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:application];
}

- (void)applicationDidBecomeActive
{
    if (self.bEnableTouchID) {
        if (self.bInEnterPasswordView && [MNLib getValueByKey:kPasswordKey] != nil) {
            [self showEnterTouchID];
        }
    }
}

#pragma mark
#pragma mark 函数: 辅助函数
- (void)showEnterPassword
{
    self.textOfEdit.text = @"";
    [self.textOfEdit becomeFirstResponder];
}

- (void)showEnterTouchID
{
    LAContext *context = [[LAContext alloc] init];
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹解锁" reply:^(BOOL success, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{  
            if (success) {
                [self passwordRightAndGoContent];
            } else {
                [MNLib showTitle:@"指纹错误" message:nil delayTime:1.5 completion:^{}];
            }
        });
    }];
}

- (void)passwordRightAndGoContent
{
    [self performSegueWithIdentifier:@"toContent" sender:nil];
    self.bInEnterPasswordView = NO;
}

#pragma mark
#pragma mark 事件响应
- (IBAction)textDidEnd:(id)sender 
{
    if (![MNLib getValueByKey:kPasswordKey]) {
        NSLog(@"%@", @"程序错误: 现在还没有密码，用户却能走到这一步");
    } else {
        NSString *strStoredPassword = [MNLib getValueByKey:kPasswordKey];
        if ([strStoredPassword isEqualToString:self.textOfEdit.text]) {
            [self.textOfEdit resignFirstResponder];
            [self passwordRightAndGoContent];
        } else {
            [MNLib showTitle:@"password error!" message:nil delayTime:0.5 completion:^{
                self.textOfEdit.text = @"";
                [self.textOfEdit becomeFirstResponder];
            }];
        }
    }
}

- (IBAction)buttonOfUseTouchIDTouched:(id)sender 
{
    [self.textOfEdit resignFirstResponder];
    [self showEnterTouchID];
}
@end
