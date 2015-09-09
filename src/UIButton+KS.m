//
//  UIButton+KS.m
//  LearningBar
//
//  Created by bing.hao on 15/5/21.
//  Copyright (c) 2015年 www.xuexiba.com. All rights reserved.
//

#import "UIButton+KS.h"

@implementation UIButton (KS)

- (void)addTarget:(id)target action:(SEL)action
{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
