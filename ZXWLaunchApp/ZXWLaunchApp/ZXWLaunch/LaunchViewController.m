//
//  LanchViewController.m
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/15.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "LaunchViewController.h"



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

#pragma mark - Init;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.imageView.frame =[UIScreen mainScreen].bounds;
    
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
        [self.view addSubview:self.imageView];
        self.timer =[NSTimer scheduledTimerWithTimeInterval:(self.itemModel.lanchMaxTime == 0?3:self.itemModel.lanchMaxTime) target:self selector:@selector(removeTimer:) userInfo:nil repeats:NO];
    }
    
    
}
-(void)removeTimer:(NSTimer *)timer {
    
    [self.timer invalidate];
    self.timer =nil;
    
    self.view.window.rootViewController =self.rootVC;
    
}
// 加载广告或者网络启动页
-(void)creatAdvertisementImages {
    
    
}
// 加载本地视频
-(void)creatLocalVideos {
    
    
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
