//
//  NSURL+KS.h
//  KSToolkit
//
//  Created by bing.hao on 14/11/27.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (KS)

/**
 * @brief 获取当前字符串所带的参数
 */
- (NSDictionary *)getUrlParams;

@end
