//
//  AppDelegate.h
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/14.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LaunchItemModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// 跳到广告详情页
-(void)tapInAdvDetail:(id)vc andModel:(LaunchItemModel *)itemModel;
@end

