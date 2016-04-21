//
//  ALPopMenu.m
//  ALDropDownMenu
//
//  Created by Arclin on 15/11/19.
//  Copyright © 2015年 sziit. All rights reserved.
//

#import "ALPopMenu.h"
#import "ALCover.h"
#import "ALScrollButtonsView.h"
#import "ALTableButtonsViewController.h"
#import "ALImageView.h"

#define ALKeyWindow [UIApplication sharedApplication].keyWindow

@interface ALPopMenu()<ALOptionDelegate,ALTableViewCellDelegate>

@property (nonatomic,strong) ALScrollButtonsView *scrollButtonsView;

@property (nonatomic,strong) ALTableButtonsViewController *tableButtonsViewController;

@property (nonatomic,strong) ALImageView *menuImageView;

@end

@implementation ALPopMenu

- (ALScrollButtonsView *)scrollButtonsView
{
    if (!_scrollButtonsView) {
        _scrollButtonsView = [[ALScrollButtonsView alloc] initWithFrame:self.bounds];
        _scrollButtonsView.optionDelegate = self;
    }
    return _scrollButtonsView;
}

- (ALTableButtonsViewController *)tableButtonsViewController
{
    if(!_tableButtonsViewController){
        _tableButtonsViewController = [[ALTableButtonsViewController alloc] init];
        _tableButtonsViewController.tableView.frame = self.bounds;
        _tableButtonsViewController.cellDelegate = self;
    }
    return _tableButtonsViewController;
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
        case ALMenuTypeScroller:
            self.contentView = self.scrollButtonsView;
            self.scrollButtonsView.buttonTitles = self.buttonTitles;
            break;
        case ALMenuTypeTable:
            self.contentView = self.tableButtonsViewController.tableView;
            self.tableButtonsViewController.buttonTitles = self.buttonTitles;
            break;
        case ALMenuTypeImage:
            self.contentView = self.menuImageView;
            break;
        default:
            self.contentView = self.scrollButtonsView;
            self.scrollButtonsView.buttonTitles = self.buttonTitles;
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

- (void)optionDidClicked:(UIButton *)button
{
    if ([_popMenuDelegate respondsToSelector:@selector(optionBtnDidClick:)]) {
        [_popMenuDelegate optionBtnDidClick:button];
    }
}

- (void)tableViewCellDidClick:(UITableViewCell *)cell options:(NSArray *)options
{
    if ([_popMenuDelegate respondsToSelector:@selector(cellDidClick:options:)]) {
        [_popMenuDelegate cellDidClick:cell options:options];
    }
}

@end
