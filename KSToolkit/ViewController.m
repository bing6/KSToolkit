//
//  ViewController.m
//  KSToolkit
//
//  Created by bing.hao on 15/9/9.
//  Copyright (c) 2015年 bing.hao. All rights reserved.
//

#import "ViewController.h"
#import "UIView+KS.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGSize s1 = CGSizeMake(1334, 768);
    CGSize s2 = CGSizeMake(320, 480);
    
    NSLog(@"%f", s1.width * s1.height);
    NSLog(@"%f", s2.width * s2.height);
    
    NSLog(@"%f", (s2.width + s2.height) / (s1.width + s1.height));
    NSLog(@"%f", (s1.width * s1.height) / (s2.width * s2.height));
    
    NSLog(@"%@", NSStringFromCGSize(CGSizeMake((s2.width + s2.height) / (s1.width + s1.height) * s1.width, (s2.width + s2.height) / (s1.width + s1.height) * s1.height)));
    
    
    [self.view onClickEvent:^{
        NSLog(@"1");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
