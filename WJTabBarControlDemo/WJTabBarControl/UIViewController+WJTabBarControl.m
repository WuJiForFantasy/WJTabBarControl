//
//  UIViewController+WJTabBarControl.m
//  WJTabBarControlDemo
//
//  Created by 粒子财富 on 16/6/16.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import "UIViewController+WJTabBarControl.h"
#import "WJTabBarControl.h"
@implementation UIViewController (WJTabBarControl)

/**
 *  隐藏标签栏
 */
- (void)tabBarHidden {
    WJTabBarControl *tabBar= (WJTabBarControl *)self.tabBarController;
    [tabBar tabBarHidden];
}

/**
 *  显示标签栏
 */
- (void)tabBarShow {
    WJTabBarControl *tabBar= (WJTabBarControl *)self.tabBarController;
    [tabBar tabBarShow];
}


@end
