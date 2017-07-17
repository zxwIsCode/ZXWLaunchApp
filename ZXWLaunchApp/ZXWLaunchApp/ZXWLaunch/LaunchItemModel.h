//
//  LaunchItemModel.h
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/15.
//  Copyright © 2017年 DaviD. All rights reserved.
//  跳转到控制器的参数

#import <Foundation/Foundation.h>

@interface LaunchItemModel : NSObject

// 本地启动页图片,网络启动页图片url,本地视频名称等
@property(nonatomic,copy)NSString *launchUrl;

// 本地视频了类型，默认为MP4（只有本地视频的时候有用，其他情况没用）
@property(nonatomic,copy)NSString *videoUrlKind;
// 启动页最长时间，以s为单位,默认为3s
@property(nonatomic,assign)NSInteger lanchMaxTime;
// 启动页（广告）跳转的url，默认为我的技术网址
@property(nonatomic,copy)NSString *launchJumpUrl;
@end
