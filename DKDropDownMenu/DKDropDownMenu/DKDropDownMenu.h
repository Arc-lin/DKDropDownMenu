//
//  DKDropDownMenu.h
//  DKDropDownMenu
//
//  Created by Arclin on 16/4/15.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DKButtonDelegate <NSObject>

@optional
- (void)optionDidClick:(UIButton *)button;

@end

@interface DKDropDownMenu : UIScrollView

/**
 * 与父视图的顶部距离
 */
@property (nonatomic,assign) CGFloat topMarginToSuperView;

/**
 * 显示的按钮的数量
 */
@property (nonatomic,assign) CGFloat numOfShowOptions;

/**
 * 每个按钮的高度
 */
@property (nonatomic,assign) CGFloat buttonHeight;

/**
 *  父视图（需要添加下拉菜单的视图）
 */
@property (nonatomic,weak) UIView *parentView;

/**
 * 选项数组
 */
@property (nonatomic,strong) NSArray *options;

/**
 * 代理
 */
@property (nonatomic,assign) id<DKButtonDelegate> optionDelegate;

/**
 * 初始化方法
 */
- (instancetype)initDKDropDownMenuWithOptions:(nonnull NSArray<NSString *> *)options parentView:(nonnull UIView *)parentView buttonHeight:(CGFloat)buttonHeight topMargin:(CGFloat)topMargin numberOfShowOptions:(CGFloat)numberOfShowOptions;

/**
 *  显示菜单
 */
- (void)showMenuWithAnimted:(BOOL)animate;
/**
 *  隐藏菜单
 */
- (void)hideMenuWithAnimate:(BOOL)animate;

@end
