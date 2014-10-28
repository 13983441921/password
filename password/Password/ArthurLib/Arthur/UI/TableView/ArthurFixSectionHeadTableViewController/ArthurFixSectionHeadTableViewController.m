//
//  ArthurFixSectionHeadTableViewController.m
//  KeeFit
//
//  Created by lichen on 6/12/14.
//  Copyright (c) 2014 codoon. All rights reserved.
//

#import "ArthurFixSectionHeadTableViewController.h"

@interface ArthurFixSectionHeadTableViewController ()

@end

@implementation ArthurFixSectionHeadTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //固定section高度
    self.tableView.sectionFooterHeight = 1.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//固定section高度: header高度
- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section
{
    return 20.0;
}

@end
