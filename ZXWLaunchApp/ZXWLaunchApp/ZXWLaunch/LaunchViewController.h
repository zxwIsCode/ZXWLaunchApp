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
}LaunchType;

@interface LaunchViewController : UIViewController

@property(nonatomic,strong)LaunchItemModel *itemModel;

// 是不是广告，主要区分广告还是网络加载的图片
@property(nonatomic,assign)BOOL isAdv;
// 是否重复播放视频还是 播放完毕自动跳入界面
@property(nonatomic,assign)BOOL isRepeatVideo;

-(instancetype)initWithRootVC:(UIViewController *)rootVC andLaunchType:(LaunchType)type;
@end
