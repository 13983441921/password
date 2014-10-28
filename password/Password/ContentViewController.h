//
//  ContentViewController.h
//  Password
//
//  Created by lichen on 6/15/14.
//  Copyright (c) 2014 Minicoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PasswordConstant.h"

@interface ContentViewController : UIViewController

@property CGRect textFrame;
@property CGRect textShortFrame;

@property (weak, nonatomic) IBOutlet UITextView *textViewOfContent;
- (IBAction)buttonOfSaveTouched:(id)sender;

@end
