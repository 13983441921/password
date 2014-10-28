//
//  ArthurSingleSelectTableViewController.h
//  选择
//
//  Created by lichen on 6/11/14.
//  Copyright (c) 2014 Minicoder. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^onSelected)(int nSelectedIndex);

@interface ArthurSingleSelectTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *arrData;
@property int nSelectedIndex;
@property (nonatomic, strong) onSelected handerSelected;

- (void)setData:(NSArray *)arrData withIndex:(int)nSelectedIndex onSelected:(onSelected)handerSelected;

@end
