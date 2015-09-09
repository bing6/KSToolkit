//
//  NSURL+KS.m
//  KSToolkit
//
//  Created by bing.hao on 14/11/27.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import "NSURL+KS.h"

@implementation NSURL (KS)

- (NSDictionary *)getUrlParams
{
    if (self.query != nil && self.query.length > 0) {
        
        NSMutableDictionary * tmp = [NSMutableDictionary new];
        
        NSArray * items = [self.query componentsSeparatedByString:@"&"];
        
        for (int i = 0; i < [items count]; i++) {
            
            NSString * subItem = items[i];
            
            NSArray * p = [subItem componentsSeparatedByString:@"="];
            
            if (p.count == 2) {
                
                [tmp setObject:p[1] forKey:p[0]];
                
            }
        }
        
        return tmp;
    }
    
    return Nil;
}

@end
