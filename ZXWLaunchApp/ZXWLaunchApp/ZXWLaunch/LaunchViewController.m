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

// 控件设计如下：
@property(nonatomic,strong)UIImageView *imageView;


@end

@implementation LaunchViewController

#pragma mark - Init

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.imageView.frame =[UIScreen mainScreen].bounds;
    [self.view addSubview:self.imageView];
    
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
    }
    
}

// 加载广告或者网络启动页
-(void)creatAdvertisementImages {
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.itemModel.launchUrl] placeholderImage:[UIImage imageNamed:@"LaunchImg@2x.png"]];
    
    if (self.isAdv) {// 广告
        self.imageView.userInteractionEnabled =YES;
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(comeInAdvertDetail:)];
        [self.imageView addGestureRecognizer:tap];
        
        // 广告的倒计时标志
        
    }else { //非广告为网络图片
        self.imageView.userInteractionEnabled =NO;
        self.timer =[NSTimer scheduledTimerWithTimeInterval:self.itemModel.lanchMaxTime target:self selector:@selector(removeTimer:) userInfo:nil repeats:NO];
    }
    
}
// 加载本地视频
-(void)creatLocalVideos {
    
    
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
    AppDelegate *delegate =[UIApplication sharedApplication].delegate;
    // 跳到广告详情页
    [delegate tapInAdvDetail:self andModel:self.itemModel];
    
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

@end
