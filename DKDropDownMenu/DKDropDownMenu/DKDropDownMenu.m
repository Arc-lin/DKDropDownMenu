//
//  DKDropDownMenu.m
//  DKDropDownMenu
//
//  Created by Arclin on 16/4/15.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import "DKDropDownMenu.h"

@interface DKDropDownMenu()

/**
 *  当前选择的按钮
 */
@property (nonatomic,weak) UIButton *selectButton;


@end

@implementation DKDropDownMenu


- (instancetype)initDKDropDownMenuWithOptions:(NSArray<NSString *> *)options parentView:(UIView *)parentView buttonHeight:(CGFloat)buttonHeight topMargin:(CGFloat)topMargin numberOfShowOptions:(CGFloat)numberOfShowOptions
{
    // 成员变量赋值
    self.parentView = parentView;
    self.buttonHeight = buttonHeight;
    self.topMarginToSuperView = topMargin;
    self.numOfShowOptions = numberOfShowOptions;
    self.options = options;
    
    // 设置菜单
    DKDropDownMenu *menu = [[DKDropDownMenu alloc] init];
    menu.backgroundColor = [UIColor grayColor];
    menu.contentSize = CGSizeMake(parentView.frame.size.width,buttonHeight *  options.count);
    CGFloat x = parentView.frame.origin.x;
    CGFloat y = CGRectGetMaxY(parentView.frame) + topMargin;
    CGFloat w = parentView.frame.size.width;
    CGFloat h = numberOfShowOptions * buttonHeight;
    menu.frame = CGRectMake(x, y, w, h);
    
    // 添加按钮
    int i = 0;
    for (NSString *option in options) {
        UIButton *button = [self createDKButtonWithTitle:option];
        button.frame = CGRectMake(0, buttonHeight * i, menu.frame.size.width, buttonHeight);
        i++;
        [menu addSubview:button];
    }
    
    return menu;
}

- (UIButton *)createDKButtonWithTitle:(NSString *)title
{
    UIButton *dk_button  = [UIButton buttonWithType:UIButtonTypeCustom];
    [dk_button setTitle:title forState:UIControlStateNormal];
    [dk_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dk_button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    dk_button.titleLabel.font = [UIFont systemFontOfSize:14];
    dk_button.backgroundColor = [UIColor lightGrayColor];
    
    return dk_button;
}

- (void)btnClick:(UIButton *)button
{
    _selectButton.backgroundColor = [UIColor lightGrayColor];
    [_selectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _selectButton = button;
    if([_optionDelegate respondsToSelector:@selector(optionDidClick:)]){
        [_optionDelegate optionDidClick:button];
    }
}

@end
