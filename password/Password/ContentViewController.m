//
//  ContentViewController.m
//  Password
//
//  Created by lichen on 6/15/14.
//  Copyright (c) 2014 Minicoder. All rights reserved.
//

#import "ContentViewController.h"
#import "MNLib.h"

#define kContent @"kContent"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化键盘是否出现时的textview的frame
    self.textFrame = self.textViewOfContent.frame;
    self.textShortFrame = CGRectMake(self.textFrame.origin.x, self.textFrame.origin.y, self.textFrame.size.width, self.textFrame.size.height - 216);
    
    [self registerForKeyboardNotifications];
    [self registerForUIApplicationWillResignActive];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self showContext];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self saveContext];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark
#pragma mark 初始化
//注册键盘事件
- (void)registerForKeyboardNotifications 
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(keyboardWasShow:)
                                                name:UIKeyboardDidShowNotification
                                              object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(keyboardWillBeHidden:)
                                                name:UIKeyboardWillHideNotification
                                              object:nil];
}

//注册程序失去焦点事件
- (void)registerForUIApplicationWillResignActive
{
    UIApplication *application = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive) name:UIApplicationWillResignActiveNotification object:application];
}

#pragma mark
#pragma mark 函数: 显示、保存内容
- (void)saveContext
{
    [MNLib setValue:self.textViewOfContent.text key:kContent];
}

- (void)showContext
{
    self.textViewOfContent.text = [MNLib getValueByKey:kContent];
}

#pragma mark
#pragma mark 事件响应
- (IBAction)buttonOfSaveTouched:(id)sender 
{
    [MNLib setValue:self.textViewOfContent.text key:kContent];
    [self.textViewOfContent resignFirstResponder];
}

//响应程序失去焦点事件
- (void)applicationWillResignActive
{
    [MNLib setValue:self.textViewOfContent.text key:kContent];
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)keyboardWasShow:(NSNotification *)notification {
    self.textViewOfContent.frame = self.textShortFrame;
}

- (void)keyboardWillBeHidden:(NSNotification *)notification{
    self.textViewOfContent.frame = self.textFrame;
}

@end
