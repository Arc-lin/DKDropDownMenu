//
//  ALTableButtonsViewController.m
//  DKDropDownMenuDemo
//
//  Created by Arclin on 16/4/21.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import "ALTableButtonsViewController.h"

@interface ALTableButtonsViewController ()

@end

@implementation ALTableButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.buttonTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell = cell ? cell : [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    cell.textLabel.text = self.buttonTitles[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self cellDidClick:cell];
    for (UITableViewCell *c in tableView.visibleCells) {
        c.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)cellDidClick:(UITableViewCell *)cell
{
    if ([_cellDelegate respondsToSelector:@selector(tableViewCellDidClick:)]) {
        [_cellDelegate tableViewCellDidClick:cell];
    }
}


@end
