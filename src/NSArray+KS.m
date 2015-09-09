//
//  NSArray+KS.m
//  KSToolkit
//
//  Created by bing.hao on 14/12/10.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import "NSArray+KS.h"

@implementation NSArray (KS)

- (NSArray *)findByPredicateExpression:(NSString *)exp
{
    NSPredicate * p = [NSPredicate predicateWithFormat:exp];
    
    return [self filteredArrayUsingPredicate:p];
}

- (NSArray *)findByPredicateExpression:(NSString *)exp args:(NSArray *)args
{
    NSPredicate * p = [NSPredicate predicateWithFormat:exp argumentArray:args];
    
    return [self filteredArrayUsingPredicate:p];
}

- (BOOL)existsByPredicateExpression:(NSString *)exp
{
    return [[self findByPredicateExpression:exp] count] > 0;
}

- (BOOL)existsByPredicateExpression:(NSString *)exp args:(NSArray *)args
{
    return [[self findByPredicateExpression:exp args:args] count] > 0;
}

- (id)singeByPredicateExpression:(NSString *)exp
{
    return [[self findByPredicateExpression:exp] firstObject];
}

- (id)singeByPredicateExpression:(NSString *)exp args:(NSArray *)args
{
    return [[self findByPredicateExpression:exp args:args] firstObject];
}

@end
