//
//  ViewController.m
//  DKDropDownMenu
//
//  Created by Arclin on 16/4/15.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import "ViewController.h"
#import "DKDropDownMenu.h"

@interface ViewController ()<DKButtonDelegate>

/**
 *  按钮
 */
@property (nonatomic,weak) UIButton *button;

/**
 * 菜单
 */
@property (nonatomic,strong) DKDropDownMenu *menu;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    [self setupTestButton];
    
    DKDropDownMenu *menu = [[DKDropDownMenu alloc] initDKDropDownMenuWithOptions:@[@"测试按钮1",@"测试按钮2",@"测试按钮3",@"测试按钮4",@"测试按钮5",@"测试按钮6",@"测试按钮7"] parentView:self.button buttonHeight:40 topMargin:5 numberOfShowOptions:3.5];
//    menu.buttonHeight = 40;
//    menu.numOfShowOptions = 3;
//    menu.topMarginToSuperView = 5;
    menu.hidden = YES;
    menu.optionDelegate = self;
    _menu = menu;
    [self.view addSubview:menu];
}

/**
 *  测试按钮
 */
- (void)setupTestButton
{
    UIButton *button = [[UIButton alloc] init];
    CGRect rect = button.frame;
    rect.size.width = 100;
    rect.size.height = 40;
    button.frame = rect;
    button.center = self.view.center;
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [button setTitle:@"点击测试" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.button = button;
}


- (void)buttonDidClick
{
    if (_menu.hidden) {
        _menu.hidden = NO;
    }else{
        _menu.hidden = YES;
    }
}

- (void)optionDidClick:(UIButton *)button
{
    _menu.hidden = YES;
    [self.button setTitle:button.titleLabel.text forState:UIControlStateNormal];
    NSLog(@"%@",button.titleLabel.text);
}

@end
