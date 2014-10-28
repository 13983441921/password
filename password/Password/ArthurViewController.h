//
//  ArthurViewController.h
//  Password
//
//  Created by lichen on 6/15/14.
//  Copyright (c) 2014 Minicoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PasswordConstant.h"

@interface ArthurViewController : UIViewController

@property BOOL bEnableTouchID;
@property BOOL bHasSetPassword;
@property BOOL bInEnterPasswordView;

@property (weak, nonatomic) IBOutlet UITextField *textOfEdit;
- (IBAction)textDidEnd:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *buttonOfUseTouchID;

- (IBAction)buttonOfUseTouchIDTouched:(id)sender;

@end
