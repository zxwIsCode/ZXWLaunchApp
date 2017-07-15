//
//  MyWebViewViewController.m
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/15.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "MyWebViewViewController.h"

@interface MyWebViewViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *webView;

@end

@implementation MyWebViewViewController

#pragma mark - init
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"我的技术网址";
    
    self.webView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:self.webView];
    
}
#pragma mark - UIWebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"开始加载了");
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSLog(@"加载完成了");
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"加载失败了");
}

#pragma mark - Setter & Getter
-(UIWebView *)webView {
    
    if (!_webView) {
        _webView =[[UIWebView alloc]init];
        NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jianshu.com/nb/7415402"]];
        [_webView loadRequest:request];
        _webView.delegate =self;
    }
    return _webView;
}

@end
