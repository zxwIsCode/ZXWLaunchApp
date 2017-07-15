//
//  DisplayHelper.h
//  Ordering
//
//  Created by AaronKwok on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"


@interface DisplayHelper : NSObject


+ (DisplayHelper *)shareDisplayHelper;

//以下2个显示正在加载中。。。（不会自动消失）
- (void)showLoading:(UIView *)aView;
- (void)showLoading:(UIView *)aView noteText:(NSString *)noteText;

//手动隐藏对应HUD
- (void)hideLoading:(UIView *)aView;

//以下7个用于显示加载成功的浮动框(可自动消失)
//以下4个用于显示加载成功的浮动框（默认1.5秒自动消失）
+(void)displaySuccessAlert:(NSString*)title message:(NSString*)message;
+(void)displaySuccessAlert:(NSString*)message;
+(void)displaySuccessAlert:(NSString*)title message:(NSString*)message onView:(UIView*)aView;
+(void)displaySuccessAlert:(NSString*)message onView:(UIView*)aView;

//以下3个用于显示加载成功的浮动框（默认interval秒自动消失）
//参数HUD：表示自己可以继承HUD，然后做自己的效果，传过来
//参数interval：传递浮动框多长时间消失
+(void)displaySuccessAlert:(NSString *)message onHUD:(MBProgressHUD *)HUD;
+(void)displaySuccessAlert:(NSString*)message interval:(float)interval;
+(void)displaySuccessAlert:(NSString*)message interval:(float)interval onHUD:(MBProgressHUD *)HUD;


//以下6个用于显示提示信息或者失败的浮动框(可自动消失)

//以下4个用于显示提示信息或者失败的浮动框（默认1.5秒自动消失）
+(void)displayWarningAlert:(NSString*)message;
+(void)displayWarningAlert:(NSString*)title message:(NSString*)message;
+(void)displayWarningAlert:(NSString*)message onView:(UIView*)aView;
+(void)displayWarningAlert:(NSString*)title message:(NSString*)message onView:(UIView*)aView;
//以下2个用于显示提示信息或者失败的浮动框（默认interval秒自动消失）
//参数HUD：表示自己可以继承HUD，然后做自己的效果，传过来
//参数interval：传递浮动框多长时间消失
+(void)displayWarningAlert:(NSString*)message onHUD:(MBProgressHUD *)HUD;
+(void)displayWarningAlert:(NSString*)message interval:(float)interval onHUD:(MBProgressHUD *)HUD;

@end
