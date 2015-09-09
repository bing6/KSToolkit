//
//  NSDate+KS.m
//  KSToolkit
//
//  Created by bing.hao on 14/11/27.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import "NSDate+KS.h"

@implementation NSDate (KS)

+ (NSDate *)dateWithString:(NSString *)str
{
    return [self dateWithString:str withFormat:KS_NSDate_STR_FORMAT];
}

+ (NSDate *)dateWithString:(NSString *)str withFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:str];
}

- (NSString *)toString
{
    return [self toString:KS_NSDate_STR_FORMAT];
}

- (NSString *)toString:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

+ (NSTimeInterval)timeIntervalByCurrentDate
{
    return [[NSDate date] timeIntervalSince1970];
}

- (NSInteger)year
{
    return [[self toString:@"yyyy"] integerValue];
}

- (NSInteger)month
{
    return [[self toString:@"MM"] integerValue];
}

- (NSInteger)day
{
    return [[self toString:@"dd"] integerValue];
}

- (NSInteger)hour
{
    return [[self toString:@"HH"] integerValue];
}

- (NSInteger)minute
{
    return [[self toString:@"mm"] integerValue];
}

- (NSInteger)second
{
    return [[self toString:@"ss"] integerValue];
}
+ (NSString *) localFomrat3:(double)date {
    NSDate * formateDate = [NSDate dateWithTimeIntervalSince1970:date];
    
    if ([formateDate isEqual:[NSDate dateWithTimeIntervalSince1970:0]]) {
        return @"";
    }
    
    NSString * fstr = [formateDate toString:@"yyyy-MM-dd"];
    return fstr;
    
}
+ (NSString *) localFomrat2:(double)date {
    NSDate * formateDate = [NSDate dateWithTimeIntervalSince1970:date];
    
    if ([formateDate isEqual:[NSDate dateWithTimeIntervalSince1970:0]]) {
        return @"";
    }
    
    NSString * fstr = [formateDate toString:@"yyyy-MM-dd"];
    NSString * time = [formateDate toString:@"HH:mm"];
    return [NSString stringWithFormat:@"%@ %@",fstr,time];
}

+ (NSString *) localFomrat1:(double)date {
    NSDate * formateDate = [NSDate dateWithTimeIntervalSince1970:date];
    
    if ([formateDate isEqual:[NSDate dateWithTimeIntervalSince1970:0]]) {
        return @"";
    }
    
    NSString * fstr = [formateDate toString:@"MM-dd"];
    NSString * time = [formateDate toString:@"HH:mm"];
    return [NSString stringWithFormat:@"%@ %@",fstr,time];

}

+ (NSString *)localFomrat:(double)date
{
    NSDate * currDate   = [NSDate date];
    NSDate * formateDate = [NSDate dateWithTimeIntervalSince1970:date];
    
    if ([formateDate isEqual:[NSDate dateWithTimeIntervalSince1970:0]]) {
        return @"";
    }
    
    NSString * fstr = [formateDate toString:@"yyyy-MM-dd"];
    NSString * cstr = [currDate toString:@"yyyy-MM-dd"];
    NSString * time = [formateDate toString:@"HH:mm"];
    
    if ([fstr isEqualToString:cstr]) {
        
        return time;
    }
    
    NSDate * yesterdayDate = [currDate dateByAddingTimeInterval:-86400];
    
    NSString * ystr = [yesterdayDate toString:@"yyyy-MM-dd"];
    
    if ([ystr isEqualToString:fstr]) {
        
        return [NSString stringWithFormat:@"昨天 %@", time];
    }
    
    NSString * t = [formateDate toString];
    NSDate * localDate = [NSDate dateWithString:t];
    
    if ([currDate timeIntervalSinceDate:localDate] / (60 * 60 * 24) <= 7) {
        
        NSCalendar * calendar = [NSCalendar currentCalendar];
        
        NSDateComponents * comp = [calendar components:NSCalendarUnitWeekday fromDate:localDate];
        
        NSInteger weekday = [comp weekday] - 1;
        
        switch (weekday) {
            case 1:
                return [NSString stringWithFormat:@"星期一 %@", time];
            case 2:
                return [NSString stringWithFormat:@"星期二 %@", time];
            case 3:
                return [NSString stringWithFormat:@"星期三 %@", time];
            case 4:
                return [NSString stringWithFormat:@"星期四 %@", time];
            case 5:
                return [NSString stringWithFormat:@"星期五 %@", time];
            case 6:
                return [NSString stringWithFormat:@"星期六 %@", time];
            default:
                return [NSString stringWithFormat:@"星期日 %@", time];
        }
    }
    return fstr;
}

@end
