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
#import "LaunchItemModel.h"

@interface AppDelegate ()

@property(nonatomic,strong)LaunchViewController *launchVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    // 确定rootVC，暂定为VC
    ViewController *vc =[[ViewController alloc]init];
    
    // 初始化要传递的参数Model
    LaunchItemModel *itemModel =[[LaunchItemModel alloc]init];
    
    // 加载本地图片
    _launchVC =[[LaunchViewController alloc]initWithRootVC:vc andLaunchType:LaunchType_Local];
    itemModel.launchUrl =@"LaunchImg@2x.png";
    // 这2个参数可以不传，用默认的
    itemModel.lanchMaxTime =5;
    itemModel.launchJumpUrl =@"www.jianshu.com";
    
    // 赋值
    _launchVC.itemModel =itemModel;
    
    self.window.rootViewController =_launchVC;
    
//    // gif网络图片
//    http://img1.gamedog.cn/2013/06/03/43-130603140F30.gif
    
    
    
    return YES;
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
