//
//  UIImageView+KS.m
//  KSToolkit
//
//  Created by bing.hao on 14/12/4.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import "UIImageView+KS.h"

@implementation UIImageView (KS)

+ (instancetype)imageViewWithName:(NSString *)name
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
}

@end
