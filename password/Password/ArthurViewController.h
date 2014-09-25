//
//  ArthurViewController.h
//  Password
//
//  Created by lichen on 6/15/14.
//  Copyright (c) 2014 Minicoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArthurViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textOfEdit;
- (IBAction)textDidEnd:(id)sender;

@end
