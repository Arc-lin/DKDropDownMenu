//
//  ALMultiSelectionsViewController.h
//  DKDropDownMenuDemo
//
//  Created by Arclin on 16/4/21.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALMultiOptionsDelegate <NSObject>

@optional
- (void)multi_optionDidClick:(UITableViewCell *)cell currentAllSelected:(NSArray *)options;

@end

@interface ALMultiSelectionsViewController : UITableViewController

/**
 *  按钮的标题
 */
@property (nonatomic,strong) NSArray<NSString *> *buttonTitles;

/**
 *  代理
 */
@property (nonatomic,assign) id<ALMultiOptionsDelegate> optionsDelegate;

@end
