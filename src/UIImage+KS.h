//
//  UIImage+KS.h
//  KSToolkit
//
//  Created by bing.hao on 14/11/30.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KS_IMAGE(n) [UIImage imageNamed:n]

@interface UIImage (KS)

/**
 * @brief 通过颜色值获取一个纯色图片
 * @param color 颜色值
 * @param size 尺寸
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/**
 * @brief 缩放图片尺寸
 * @param size 尺寸
 */
- (UIImage *)imageZoomWithSize:(CGSize)toSize;
/**
 * @brief 缩放图片尺寸并压缩质量
 * @param size 尺寸
 * @Param compression 压缩质量(0.0-1.0)
 */
- (UIImage *)imageZoomWithSize:(CGSize)size compression:(CGFloat)compression;

/**
 * @brief 高斯模糊
 */
- (UIImage *)gaussianBlur;

@end
