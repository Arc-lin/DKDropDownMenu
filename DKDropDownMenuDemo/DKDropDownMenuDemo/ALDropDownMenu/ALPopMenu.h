//
//  ALPopMenu.h
//  ALDropDownMenu
//
//  Created by Arclin on 15/11/19.
//  Copyright © 2015年 sziit. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ALMenuTypeSingleSelection, // 单选 —— 滚动视图下拉菜单
    ALMenuTypeMultiSelections,    // 多选 —— 列表视图下拉菜单
    ALMenuTypeImage     // 图片下拉菜单（这样子就不叫菜单了吧）
} ALMenuType;

@protocol ALPopMenuDelegate <NSObject>

@optional
/**
 *  当Type为单选 ALMenuTypeSingleSelection 的时候要用到的代理方法
 *
 *  @param btn 当前选择的选项
 */
- (void)singleOptionDidClick:(UIButton *)btn;

/**
 *  当Type为多选 ALMenuTypeMultiSelections 的时候要用到的代理方法
 *
 *  @param currentOption 当前选择的选项
 *  @param options       所有选中的选项
 */
- (void)multiOptionsDidClick:(UITableViewCell *)currentOption allOptions:(NSArray *)options;

@end

@interface ALPopMenu : UIView

/**
 * 显示弹出菜单
 */
+ (instancetype)showInRect:(CGRect)rect;

/*
 隐藏弹出菜单
 */
+ (void)hide;

/**
 *  按钮标题数组
 */
@property (nonatomic,weak) NSArray *buttonTitles;

/*
 * 内容视图
 */
@property (nonatomic,weak) UIView *contentView;

/**
 *  内容视图选择
 */
@property (nonatomic,assign) ALMenuType menuType;

/**
 *  图片
 */
@property (nonatomic,strong) UIImage *menuImage;

/**
 * 代理
 */
@property (nonatomic,assign) id<ALPopMenuDelegate> popMenuDelegate;


@end
