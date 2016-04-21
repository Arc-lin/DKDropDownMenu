//
//  ALSingleSelectionView.m
//  ALDropDownMenu
//
//  Created by Arclin on 16/4/20.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import "ALSingleSelectionView.h"

@interface ALSingleSelectionView()

/**
 * 按钮数组
 */
@property (nonatomic,strong) NSMutableArray<UIButton *> *buttons;

@end


@implementation ALSingleSelectionView

- (void)setButtons:(NSArray<UIButton *> *)buttons
{
    CGFloat height = self.buttonHight;
    if (height == 0) {
        height = 40;
    }
    self.contentSize = CGSizeMake(0, height * buttons.count);
    [buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake(0, idx * height, self.frame.size.width, height);
        obj.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [obj addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:obj];
    }];
}

- (void)btnClick:(UIButton *)button
{
    if ([_optionDelegate respondsToSelector:@selector(single_optionDidClicked:)]) {
        [_optionDelegate single_optionDidClicked:button];
    }
}

- (void)setButtonTitles:(NSArray<NSString *> *)buttonTitles
{
    _buttonTitles = buttonTitles;
    NSMutableArray *btnArr = [NSMutableArray array];
    for(NSString *title in buttonTitles) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        [btnArr addObject:button];
    }
    self.buttons = btnArr;
}

@end
