//
//  AppDelegate.m
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/14.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "AppDelegate.h"
#import "LaunchViewController.h"
#import "ViewController.h"
#import "MyWebViewViewController.h"

@interface AppDelegate ()

@property(nonatomic,strong)LaunchViewController *launchVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    // 确定rootVC，暂定为VC
    ViewController *vc =[[ViewController alloc]init];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:vc];
    
    // 初始化要传递的参数Model
    LaunchItemModel *itemModel =[[LaunchItemModel alloc]init];
    
    // 第1种：加载本地图片
    [self initLocalPhotoNormal:itemModel andNav:nav];
    
//    // 第2.1种：加载网络图片（非广告）
//    [self initNetPhotoNormal:itemModel andNav:nav];
    
    // 第2.2种：加载广告图片
    [self initADVPhotoNormal:itemModel andNav:nav];
    
//    // 第3.1种：加载本地视频
//    [self initLocalVideoNormal:itemModel andNav:nav];
    
//    // 第3.2种：加载网络视频
//   [self initNetVideoNormal:itemModel andNav:nav];
    
    // 赋值
    _launchVC.itemModel =itemModel;
    
    self.window.rootViewController =_launchVC;
    
    return YES;
}
// 第1种：加载本地图片
-(void)initLocalPhotoNormal:(LaunchItemModel *)itemModel andNav:(UINavigationController *)nav {
    _launchVC =[[LaunchViewController alloc]initWithRootVC:nav andLaunchType:LaunchType_Local];
    itemModel.launchUrl =@"LaunchImg@2x.png";
    // 这个参数可以不传，用默认的
    itemModel.lanchMaxTime =5;
}

//第2.1种：加载网络图片（非广告）
-(void)initNetPhotoNormal:(LaunchItemModel *)itemModel andNav:(UINavigationController *)nav {
    _launchVC =[[LaunchViewController alloc]initWithRootVC:nav andLaunchType:LaunchType_Advert];
    itemModel.launchUrl =@"http://img1.gamedog.cn/2013/06/03/43-130603140F30.gif";
    // 这2个参数可以不传，用默认的
    itemModel.lanchMaxTime =5;
    _launchVC.isAdv =NO;
}
//第2.2种：加载广告图片
-(void)initADVPhotoNormal:(LaunchItemModel *)itemModel andNav:(UINavigationController *)nav {
    _launchVC =[[LaunchViewController alloc]initWithRootVC:nav andLaunchType:LaunchType_Advert];
    itemModel.launchUrl =@"http://img1.gamedog.cn/2013/06/03/43-130603140F30.gif";
    // 这2个参数可以不传，用默认的
    itemModel.lanchMaxTime =5;
    itemModel.launchJumpUrl =@"https://github.com/zxwIsCode";
    // 这个参数必须传，而且必须是yes
    _launchVC.isAdv =YES;
}
// 第3.1种：加载本地视频
-(void)initLocalVideoNormal:(LaunchItemModel *)itemModel andNav:(UINavigationController *)nav {
    _launchVC =[[LaunchViewController alloc]initWithRootVC:nav andLaunchType:LaunchType_Video];
    // 本地文件路径地址
    itemModel.launchUrl = [[NSBundle mainBundle] pathForResource:@"XYVideo" ofType:@"mp4"];
    // 当为本地视频时这个参数可不填
    _launchVC.videoType =Video_Local;
    // 播放完毕，是否重复播放还是直接跳到主界面
    _launchVC.isRepeatVideo =YES;
    _launchVC.volume =0.7;
}
// 第3.2种：加载网络视频
-(void)initNetVideoNormal:(LaunchItemModel *)itemModel andNav:(UINavigationController *)nav {
    _launchVC =[[LaunchViewController alloc]initWithRootVC:nav andLaunchType:LaunchType_Video];
    // 本地文件路径地址
    itemModel.launchUrl = @"http://v1.mukewang.com/57de8272-38a2-4cae-b734-ac55ab528aa8/L.mp4";
    // 这个参数必填，而且必须是Video_Net
    _launchVC.videoType =Video_Net;
    // 播放完毕，是否重复播放还是直接跳到主界面
    _launchVC.isRepeatVideo =NO;
    _launchVC.volume =0.7;
}


// 跳到广告详情页
-(void)tapInAdvDetail:(id)vc andModel:(LaunchItemModel *)itemModel {
    LaunchViewController *launchVC =(LaunchViewController *)vc;
    
    MyWebViewViewController *webVC =[[MyWebViewViewController alloc]init];
    webVC.itemModel =itemModel;
    [launchVC presentViewController:webVC animated:YES completion:nil];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
