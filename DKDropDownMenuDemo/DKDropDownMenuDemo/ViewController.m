//
//  ViewController.m
//  DKDropDownMenu
//
//  Created by Arclin on 16/4/15.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import "ViewController.h"
#import "ALPopMenu.h"

@interface ViewController ()<ALPopMenuDelegate>

@property (nonatomic,weak) UIButton *titleButton;

@property (nonatomic,weak) ALPopMenu *menu;

@property (nonatomic,strong) NSArray *buttonTitles;

@property (nonatomic,weak) UILabel *label;


@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"测试";
    self.buttonTitles = @[@"按钮一",@"按钮二",@"按钮三",@"按钮四",@"按钮五",@"按钮六",@"按钮七"];
    
    // navigationBar 的 titleView上的button测试
    [self setupNavigationTitleView];
    
    // 测试label
    [self setupLabel];
}

/**
 *  测试按钮
 */
- (void)setupNavigationTitleView{
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleButton setTitle:@"测试" forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    _titleButton = titleButton;
    self.navigationItem.titleView = titleButton;
}

- (void)setupLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 300)];
    label.numberOfLines = 0;
    self.label = label;
    [self.view addSubview:label];
}

// 以后只要显示在最前面的控件，一般都加在主窗口
// 点击标题按钮
- (void)titleClick:(UIButton *)button{
    
    // 弹出pop菜单
    CGFloat popW = 100;
    CGFloat popH = 200;
    CGFloat popX = self.view.frame.size.width / 2 - popW / 2;
    CGFloat popY = 70;
    
    ALPopMenu *menu = [ALPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];
    menu.buttonTitles = self.buttonTitles;
    menu.menuImage = [UIImage imageNamed:@"1"];
    menu.menuType = ALMenuTypeTable;
    menu.popMenuDelegate = self;
    self.menu = menu;
    
}

#pragma mark - <ALPopMenuDelegate>

- (void)optionBtnDidClick:(UIButton *)btn
{
    //隐藏pop菜单
    [ALPopMenu hide];
    [self.titleButton setTitle:btn.titleLabel.text forState:UIControlStateNormal];
    [self.titleButton sizeToFit];
    
//    NSLog(@"%@",btn.titleLabel.text);
}

- (void)cellDidClick:(UITableViewCell *)cell options:(NSArray *)options
{
    //隐藏pop菜单
    [self.titleButton setTitle:cell.textLabel.text forState:UIControlStateNormal];
    [self.titleButton sizeToFit];
    NSMutableString *str = [NSMutableString string];
    for (UITableViewCell *cell in options) {
        [str appendString:cell.textLabel.text];
    }
    self.label.text = str;
//    NSLog(@"%@",cell.textLabel.text);
}

@end
