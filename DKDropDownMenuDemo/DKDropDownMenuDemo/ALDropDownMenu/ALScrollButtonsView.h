//
//  ALScrollButtonsView.h
//  ALDropDownMenu
//
//  Created by Arclin on 16/4/20.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALOptionDelegate <NSObject>

- (void)optionDidClicked:(UIButton *)button;

@end


@interface ALScrollButtonsView : UIScrollView

/**
 * 按钮标题数组
 */
@property (nonatomic,strong) NSArray<NSString *> *buttonTitles;

/**
 *  按钮高度
 */
@property (nonatomic,assign) CGFloat buttonHight;

/**
 * 代理
 */
@property (nonatomic,assign) id<ALOptionDelegate> optionDelegate;


@end
