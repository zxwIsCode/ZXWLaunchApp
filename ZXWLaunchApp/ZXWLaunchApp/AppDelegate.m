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
    
// ######################第1种：加载本地图片#######################
//    _launchVC =[[LaunchViewController alloc]initWithRootVC:nav andLaunchType:LaunchType_Local];
//    itemModel.launchUrl =@"LaunchImg@2x.png";
//    // 这个参数可以不传，用默认的
//    itemModel.lanchMaxTime =5;
// ######################第2.1种：加载网络图片（非广告）#######################
//    _launchVC =[[LaunchViewController alloc]initWithRootVC:nav andLaunchType:LaunchType_Advert];
//    itemModel.launchUrl =@"http://img1.gamedog.cn/2013/06/03/43-130603140F30.gif";
//    // 这2个参数可以不传，用默认的
//    itemModel.lanchMaxTime =5;
//    _launchVC.isAdv =NO;
// ######################第2.2种：加载广告图片#######################
    _launchVC =[[LaunchViewController alloc]initWithRootVC:nav andLaunchType:LaunchType_Advert];
    itemModel.launchUrl =@"http://img1.gamedog.cn/2013/06/03/43-130603140F30.gif";
    // 这2个参数可以不传，用默认的
    itemModel.lanchMaxTime =5;
    itemModel.launchJumpUrl =@"https://github.com/zxwIsCode";
    // 这个参数必须传，而且必须是yes
    _launchVC.isAdv =YES;
// ######################第3种：加载本地视频#######################
    // 赋值
    _launchVC.itemModel =itemModel;
    
    self.window.rootViewController =_launchVC;
    
//    // gif网络图片
//
    
    
    
    return YES;
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
