//
//  LaunchItemModel.m
//  ZXWLaunchApp
//
//  Created by jgrm on 2017/7/15.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "LaunchItemModel.h"

@implementation LaunchItemModel


-(NSInteger)lanchMaxTime {
    if (!_lanchMaxTime) {
        _lanchMaxTime =3;
    }
    return _lanchMaxTime;
}

@end
