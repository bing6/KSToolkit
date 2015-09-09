//
//  UITableView+KS.h
//  KSToolkit
//
//  Created by bing.hao on 14/12/2.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (KS)

/**
 * @brief 根据子视图获取当前所在的Cell
 */
- (UITableViewCell *)cellWithSubView:(UIView *)subView;
/**
 * @brief 根据子视图获取当前Cell的IndexPath
 */
- (NSIndexPath *)indexPathWithSubView:(UIView *)subView;

@end
