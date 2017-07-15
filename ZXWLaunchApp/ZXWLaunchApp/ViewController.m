//
//  ViewController.m
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/14.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * showLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 150)];
    showLabel.numberOfLines = 0;
    showLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    showLabel.center = CGPointMake(self.view.bounds.size.width/2, 120);
    [self.view addSubview:showLabel];
    showLabel.text = @"欢迎欢迎，热烈欢迎！";
    showLabel.textAlignment = NSTextAlignmentCenter;
    showLabel.textColor = [UIColor redColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
