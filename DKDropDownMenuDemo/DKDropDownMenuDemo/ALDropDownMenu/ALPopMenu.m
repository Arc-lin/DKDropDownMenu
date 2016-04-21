//
//  ALPopMenu.m
//  ALDropDownMenu
//
//  Created by Arclin on 15/11/19.
//  Copyright © 2015年 sziit. All rights reserved.
//

#import "ALPopMenu.h"
#import "ALCover.h"
#import "ALSingleSelectionView.h"
#import "ALMultiSelectionsViewController.h"
#import "ALImageView.h"

#define ALKeyWindow [UIApplication sharedApplication].keyWindow

@interface ALPopMenu()<ALSingleOptionDelegate,ALMultiOptionsDelegate>

@property (nonatomic,strong) ALSingleSelectionView *singleSelectionView;

@property (nonatomic,strong) ALMultiSelectionsViewController *multiSelectionsViewController;

@property (nonatomic,strong) ALImageView *menuImageView;

@end

@implementation ALPopMenu

- (ALSingleSelectionView *)singleSelectionView
{
    if (!_singleSelectionView) {
        _singleSelectionView = [[ALSingleSelectionView alloc] initWithFrame:self.bounds];
        _singleSelectionView.optionDelegate = self;
    }
    return _singleSelectionView;
}

- (ALMultiSelectionsViewController *)multiSelectionsViewController
{
    if(!_multiSelectionsViewController){
        _multiSelectionsViewController = [[ALMultiSelectionsViewController alloc] init];
        _multiSelectionsViewController.tableView.frame = self.bounds;
        _multiSelectionsViewController.optionsDelegate = self;
    }
    return _multiSelectionsViewController;
}

- (ALImageView *)menuImageView{
    if (!_menuImageView) {
        _menuImageView = [[ALImageView alloc] initWithFrame:self.bounds];
        _menuImageView.image = self.menuImage;
    }
    return _menuImageView;
}


// 显示弹出菜单
+ (instancetype)showInRect:(CGRect)rect{
    
    // 弹出蒙版
    ALCover *cover = [ALCover show];
    [cover addTarget:self action:@selector(coverDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    ALPopMenu *menu = [[ALPopMenu alloc] initWithFrame:rect];
    menu.userInteractionEnabled = YES;
    menu.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.7];
    
    [ALKeyWindow addSubview:menu];
    
    return menu;
}

// 隐藏弹出菜单和蒙版
+ (void)hide{
    for (UIView *popMenu in ALKeyWindow.subviews) {
        if ([popMenu isKindOfClass:self] || [popMenu isKindOfClass:[ALCover class]]) {
            [popMenu removeFromSuperview];
        }
    }
}

+ (void)coverDidClick
{
    //隐藏pop菜单
    [self hide];
}

- (void)setMenuType:(ALMenuType)menuType
{
    switch (menuType) {
        case ALMenuTypeSingleSelection:
            self.contentView = self.singleSelectionView;
            self.singleSelectionView.buttonTitles = self.buttonTitles;
            break;
        case ALMenuTypeMultiSelections:
            self.contentView = self.multiSelectionsViewController.tableView;
            self.multiSelectionsViewController.buttonTitles = self.buttonTitles;
            break;
        case ALMenuTypeImage:
            self.contentView = self.menuImageView;
            break;
        default:
            self.contentView = self.singleSelectionView;
            self.singleSelectionView.buttonTitles = self.buttonTitles;
            break;
    }
}

// 设置内容视图
- (void)setContentView:(UIView *)contentView
{
    //先移除之前的内容视图
    [_contentView removeFromSuperview];
    
    _contentView = contentView;
    
    [self addSubview:contentView];

}

- (void)single_optionDidClicked:(UIButton *)button
{
    if ([_popMenuDelegate respondsToSelector:@selector(singleOptionDidClick:)]) {
        [_popMenuDelegate singleOptionDidClick:button];
    }
}

- (void)multi_optionDidClick:(UITableViewCell *)cell currentAllSelected:(NSArray *)options
{
    if ([_popMenuDelegate respondsToSelector:@selector(multiOptionsDidClick:allOptions:)]) {
        [_popMenuDelegate multiOptionsDidClick:cell allOptions:options];
    }
}

@end
