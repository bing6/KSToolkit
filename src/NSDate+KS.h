//
//  NSDate+KS.h
//  KSToolkit
//
//  Created by bing.hao on 14/11/27.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KS_NSDate_STR_FORMAT @"yyyy-MM-dd HH:mm:ss"

#define KS_SECONDS_WITH_DAY      (24.f * 60.f * 60.f)
#define KS_SECONDS(s)            (24.f * 60.f * 60.f * (s))
#define KS_MILLISECONDS_WITH_DAY (24.f * 60.f * 60.f * 1000.f)
#define KS_MILLISECONDS(s)       (24.f * 60.f * 60.f * 1000.f * (s))
//将Long值转换为时间类型
#define KS_DATE_UTC1970_L(s) [NSDate dateWithTimeIntervalSince1970:(s * 0.1) / 1000]
//将Double值转换为时间类型
#define KS_DATE_UTC1970_D(s) [NSDate dateWithTimeIntervalSince1970:s]
//获取当前时间,返回的是一个LONG类型值
#define KS_DATE_NOW          ([NSDate timeIntervalByCurrentDate])

@interface NSDate (KS)

/**
 * @brief 将字符串转换为时间类型，默认格式为yyyy-MM-dd HH:mm:ss
 * @param 字符串
 */
+ (NSDate *)dateWithString:(NSString *)str;
/**
 * @brief 将字符串转换为时间类型
 * @param str    字符串
 * @param format 格式
 */
+ (NSDate *)dateWithString:(NSString *)str withFormat:(NSString *)format;
/**
 * @brief 将时间转为字符串
 */
- (NSString *)toString;
/**
 * @brief 将时间转为字符串
 * @brief format 格式
 */
- (NSString *)toString:(NSString *)format;
/**
 * @brief 将时间转为double类型
 */
+ (double)timeIntervalByCurrentDate;
+ (NSString *) localFomrat3:(double)date;
+ (NSString *) localFomrat2:(double)date;
+ (NSString *) localFomrat1:(double)date;
+ (NSString *)localFomrat:(double)date;

- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)day;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)second;

@end
