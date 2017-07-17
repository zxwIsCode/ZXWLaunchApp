//
//  LanchViewController.h
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/15.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LaunchItemModel.h"


typedef enum : NSInteger{
    LaunchType_Local, // 本地图片（gif动图）启动页
    LaunchType_Advert,// 网络启动页，含有广告或者网络的图片
    LaunchType_Video// 本地视频播放的启动页
}LaunchType; // 启动页类型

typedef enum :NSInteger{
    Video_Local, // 本地
    Video_Net // 网络
}VideoType; // 视频来源

@interface LaunchViewController : UIViewController

@property(nonatomic,strong)LaunchItemModel *itemModel;

// 是不是广告，主要区分广告还是网络加载的图片 Yes代表广告，No代表普通网络图片
@property(nonatomic,assign)BOOL isAdv;
// 是否重复播放视频还是 Yes表示播放完毕继续重复播放,No表示播放完毕后自动跳入主界面
@property(nonatomic,assign)BOOL isRepeatVideo;
// 视频播放的声音(本地视频专用)
@property(nonatomic,assign)float volume;
// 视频的来源，默认为本地
@property(nonatomic,assign)VideoType videoType;

-(instancetype)initWithRootVC:(UIViewController *)rootVC andLaunchType:(LaunchType)type;
@end
