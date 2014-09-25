//
//  ArthurViewController.m
//  Password
//
//  Created by lichen on 6/15/14.
//  Copyright (c) 2014 Minicoder. All rights reserved.
//

#import "ArthurViewController.h"
#import "MNLib.h"

#define kPasswordKey @"kPasswordKey"

@interface ArthurViewController ()

@end

@implementation ArthurViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.textOfEdit.text = @"";
    [self.textOfEdit becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textDidEnd:(id)sender {
    if (![MNLib getValueByKey:kPasswordKey]) {
        NSString *strPassword = self.textOfEdit.text;
        [MNLib setValue:strPassword key:kPasswordKey];
        self.textOfEdit.text = @"";
    } else {
        NSString *strStoredPassword = [MNLib getValueByKey:kPasswordKey];
        if ([strStoredPassword isEqualToString:self.textOfEdit.text]) {
             [self performSegueWithIdentifier:@"toContent" sender:nil];
        } else {
            [MNLib showTitle:@"password error!" message:nil delayTime:0.5 completion:^{
                self.textOfEdit.text = @"";
                [self.textOfEdit becomeFirstResponder];

            }];
        }
    }
}
@end
