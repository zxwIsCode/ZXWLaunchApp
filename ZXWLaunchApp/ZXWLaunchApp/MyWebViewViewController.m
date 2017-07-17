//
//  MyWebViewViewController.m
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/15.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "MyWebViewViewController.h"
#import "DisplayHelper.h"

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
    [[DisplayHelper shareDisplayHelper]showLoading:self.view noteText:@"礼物加载中..."];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSLog(@"加载完成了");
    [[DisplayHelper shareDisplayHelper]hideLoading:self.view];
    [DisplayHelper displaySuccessAlert:@"我的技术网址:最好的礼物 😆"];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"加载失败了");
    [[DisplayHelper shareDisplayHelper]hideLoading:self.view];
    [DisplayHelper displayWarningAlert:@"加载失败了，下次领礼物吧 ☹"];
}

#pragma mark - Setter & Getter
-(UIWebView *)webView {
    
    if (!_webView) {
        _webView =[[UIWebView alloc]init];
        if (!self.itemModel.launchJumpUrl.length) { // 不存在，默认调到我的技术网址
            self.itemModel.launchJumpUrl =@"http://www.jianshu.com/nb/7415402";
        }
        NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.itemModel.launchJumpUrl]];
        [_webView loadRequest:request];
        _webView.delegate =self;
    }
    return _webView;
}

-(LaunchItemModel *)itemModel {
    if (!_itemModel) {
        _itemModel =[[LaunchItemModel alloc]init];
    }
    return _itemModel;
}

@end
