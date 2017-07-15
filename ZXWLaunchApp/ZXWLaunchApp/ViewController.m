//
//  ViewController.m
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/14.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "ViewController.h"
#import "MyWebViewViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UILabel *titleLable;

@property(nonatomic,strong)UIButton *startButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"主页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleLable.bounds =CGRectMake(0, 0, 300, 150);
    self.titleLable.center = CGPointMake(self.view.bounds.size.width/2, 120);
    
    self.startButton.bounds =CGRectMake(0, 0, 150, 60);
    self.startButton.center =CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    
    [self.view addSubview:self.titleLable];
    [self.view addSubview:self.startButton];
    
}
-(void)startToMyWebView:(UIButton *)button {
    MyWebViewViewController *webViewVC =[[MyWebViewViewController alloc]init];
    [self.navigationController pushViewController:webViewVC animated:YES];

    
}
-(UILabel *)titleLable {
    
    if (!_titleLable) {
        _titleLable =[[UILabel alloc]init];
        _titleLable.text = @"欢迎来到主页面！";
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.textColor = [UIColor redColor];
    }
    return _titleLable;
}

-(UIButton *)startButton {
    if (!_startButton) {
        _startButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [_startButton setTitle:@"点一点有惊喜哦!" forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(startToMyWebView:) forControlEvents:UIControlEventTouchUpInside];
        _startButton.backgroundColor =[UIColor orangeColor];
        _startButton.layer.cornerRadius =5;
        _startButton.layer.borderColor =[UIColor blackColor].CGColor;
    }
    return _startButton;
}


@end
