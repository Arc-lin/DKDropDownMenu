//
//  ALTableButtonsViewController.m
//  DKDropDownMenuDemo
//
//  Created by Arclin on 16/4/21.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import "ALTableButtonsViewController.h"

@interface ALTableButtonsViewController ()

/**
 * 多选-选项数组
 */
@property (nonatomic,strong) NSMutableArray *optionArr;

@end

@implementation ALTableButtonsViewController

/**
 *  懒加载
 */
- (NSMutableArray *) optionArr
{
    if(!_optionArr){
        _optionArr = [NSMutableArray array];
    }
    return _optionArr;
}

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
  
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        // 取消打勾
        cell.accessoryType = UITableViewCellAccessoryNone;
        // 从数组删除选项
        [self.optionArr removeObject:cell];
    }else{
        // 右边的勾
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        // 添加选项到数组
        [self.optionArr addObject:cell];
    }

    // 代理传值
    [self cellDidClick:cell];

}

- (void)cellDidClick:(UITableViewCell *)cell
{
    if ([_cellDelegate respondsToSelector:@selector(tableViewCellDidClick:options:)]) {
        [_cellDelegate tableViewCellDidClick:cell options:self.optionArr];
    }
}


@end
