//
//  ALCover.m
//  ALDropDownMenu
//
//  Created by Arclin on 15/11/19.
//  Copyright © 2015年 sziit. All rights reserved.
//

#import "ALCover.h"

#define ALKeyWindow [UIApplication sharedApplication].keyWindow

@implementation ALCover

//设置浅灰色蒙版
- (void)setDimBackground:(BOOL)dimBackground
{
    _dimBackground = dimBackground;
    
    if (dimBackground) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
    }else{
        self.alpha = 1;
        self.backgroundColor = [UIColor clearColor];
    }
    
}
//显示蒙版
+ (instancetype)show
{
    ALCover *cover = [[ALCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor clearColor];
    
    [ALKeyWindow addSubview:cover];
    
    return cover;
}



@end
