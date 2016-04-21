//
//  ALCover.h
//  ALDropDownMenu
//
//  Created by Arclin on 15/11/19.
//  Copyright © 2015年 sziit. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ALCover : UIButton
/*
 显示蒙版
 */
+ (instancetype)show;

// 设置浅灰色蒙版
@property (nonatomic,assign) BOOL dimBackground;

@end
