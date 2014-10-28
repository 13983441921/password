//
//  ArthurSetPasswordController.h
//  Password
//
//  Created by lichen on 9/26/14.
//  Copyright (c) 2014 Minicoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PasswordConstant.h"

@interface ArthurSetPasswordController : UITableViewController

- (IBAction)buttonOfConfirmTouched:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldOfPassword;
@property (weak, nonatomic) IBOutlet UITextField *textFieldOfConfirmPassword;

@end
