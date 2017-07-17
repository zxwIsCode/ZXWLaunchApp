//
//  LanchViewController.m
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/15.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "LaunchViewController.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"



@interface LaunchViewController ()
// 启动页类型
@property(nonatomic,assign)LaunchType type;
// 临时记录的rootVC
@property(nonatomic,strong)UIViewController *rootVC;

// 定时器
@property(nonatomic,strong)NSTimer *timer;

// 剩余多长时间(到计时)
@property(nonatomic,assign)NSInteger lastTime;

// 广告页面是否点击了可以关闭定时器了，有以下种情况可以关闭：
// 1.正常倒计时结束
// 2.点击了跳过按钮
// 3.点击了对应的广告
@property(nonatomic,assign)BOOL isCloseTimer;

// 设计的本地和网络图片
@property(nonatomic,strong)UIImageView *imageView;

// 倒计时跳过的Button
@property(nonatomic,strong)UIButton *skipBtn;


@end

@implementation LaunchViewController

#pragma mark - Init

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    // 设置的倒计时的值赋值
    self.lastTime =self.itemModel.lanchMaxTime;
    
    self.imageView.frame =[UIScreen mainScreen].bounds;
    self.skipBtn.frame =CGRectMake(self.view.frame.size.width - 90, 20, 80, 30);
    
    
    

    // 以不同的方式加载启动页
    [self loadLaunchImages];
}

-(instancetype)initWithRootVC:(UIViewController *)rootVC andLaunchType:(LaunchType)type {
    
    if (self ==[super init]) {
        self.rootVC =rootVC;
        self.type =type;
    }
    return self;
}

#pragma mark - Private Methods

// 以不同的方式加载启动页
-(void)loadLaunchImages {
    
    switch (self.type) {
        case LaunchType_Local:
            // 加载本地图片
            [self creatLocalImages];
            break;
        case LaunchType_Advert:
            // 加载广告或者网络启动页
            [self creatAdvertisementImages];
            break;
            // 加载本地视频
        case LaunchType_Video:
            [self creatLocalVideos];
            break;
            
        default:
            NSLog(@"未知方式加载");
            break;
    }
}

// 加载本地图片
-(void)creatLocalImages {
    if (self.itemModel.launchUrl.length) {
        self.imageView.image =[UIImage imageNamed:self.itemModel.launchUrl];
        self.timer =[NSTimer scheduledTimerWithTimeInterval:self.itemModel.lanchMaxTime target:self selector:@selector(removeTimer:) userInfo:nil repeats:NO];
        [self.view addSubview:self.imageView];
        
    }
    
}

// 加载广告或者网络启动页
-(void)creatAdvertisementImages {
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.itemModel.launchUrl] placeholderImage:[UIImage imageNamed:@"LaunchImg@2x.png"]];
    [self.view addSubview:self.imageView];
    
    if (self.isAdv) {// 广告
        self.imageView.userInteractionEnabled =YES;
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(comeInAdvertDetail:)];
        [self.imageView addGestureRecognizer:tap];
        
        // 广告的倒计时标志的Button
        [self.imageView addSubview:self.skipBtn];
        
        if (!self.isCloseTimer) { // 未关闭定时器
            self.timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(continueTimer:) userInfo:nil repeats:YES];
        }
        
    }else { //非广告为网络图片
        self.imageView.userInteractionEnabled =NO;
        self.timer =[NSTimer scheduledTimerWithTimeInterval:self.itemModel.lanchMaxTime target:self selector:@selector(removeTimer:) userInfo:nil repeats:NO];
    }
    
    
}
// 加载本地视频
-(void)creatLocalVideos {
    
    
}
// 定时器的运行
-(void)continueTimer:(NSTimer *)timer {
    
    self.lastTime --;
    if(self.lastTime <0 || self.isCloseTimer){
        [self removeTimer:timer];
        self.isCloseTimer =YES;
    }
    [self.skipBtn setTitle:[NSString stringWithFormat:@"跳过 %ld",self.lastTime] forState:UIControlStateNormal];
    
}

-(void)removeTimer:(NSTimer *)timer {
    
    [self.timer invalidate];
    self.timer =nil;
    
    [self settingRootVC];
}
// 设置并跳转到rootVC
-(void)settingRootVC {
    self.view.window.rootViewController =self.rootVC;
    
}

#pragma mark - Action Methods

-(void)comeInAdvertDetail:(UITapGestureRecognizer *)gesture {
    
    self.isCloseTimer = YES;
    
    AppDelegate *delegate =[UIApplication sharedApplication].delegate;
    // 跳到广告详情页
    [delegate tapInAdvDetail:self andModel:self.itemModel];
    
    
}
-(void)skipBtnClick:(UIButton *)button {
    [self removeTimer:nil];
}

#pragma mark - Setter & Getter

-(LaunchItemModel *)itemModel {
    
    if (!_itemModel) {
        _itemModel =[[LaunchItemModel alloc]init];
    }
    return _itemModel;
}
-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView =[[UIImageView alloc]init];
    }
    return _imageView;
    
}
-(UIButton *)skipBtn {
    if (!_skipBtn) {
        _skipBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        _skipBtn.layer.masksToBounds = YES;
        _skipBtn.layer.cornerRadius = 5;
        _skipBtn.backgroundColor = [UIColor colorWithRed:125/256.0 green:125/256.0  blue:125/256.0  alpha:0.5];
        [_skipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_skipBtn addTarget:self action:@selector(skipBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.skipBtn setTitle:[NSString stringWithFormat:@"跳过 %ld",self.lastTime] forState:UIControlStateNormal];
        
    }
    return _skipBtn;
}

@end
