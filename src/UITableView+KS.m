//
//  UITableView+KS.m
//  KSToolkit
//
//  Created by bing.hao on 14/12/2.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import "UITableView+KS.h"

@implementation UITableView (KS)

- (NSIndexPath *)indexPathWithSubView:(UIView *)subView
{
    UITableViewCell * cell = [self cellWithSubView:subView];
    
    if (cell) {
        return [self indexPathForCell:cell];
    }
    return nil;
}

- (UITableViewCell *)cellWithSubView:(UIView *)subView
{
    if (subView) {
        if ([[subView superview] isKindOfClass:[UITableViewCell class]]) {
            return (UITableViewCell *)[subView superview];
        }
        return [self cellWithSubView:[subView superview]];
    }
    return nil;
}

@end
