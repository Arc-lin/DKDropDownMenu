//
//  ALTableButtonsViewController.h
//  DKDropDownMenuDemo
//
//  Created by Arclin on 16/4/21.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALTableViewCellDelegate <NSObject>

@optional
- (void)tableViewCellDidClick:(UITableViewCell *)cell options:(NSArray *)options;

@end

@interface ALTableButtonsViewController : UITableViewController

/**
 *  按钮的标题
 */
@property (nonatomic,strong) NSArray<NSString *> *buttonTitles;

/**
 *  代理
 */
@property (nonatomic,assign) id<ALTableViewCellDelegate> cellDelegate;

@end
