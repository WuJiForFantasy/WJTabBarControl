//
//  WJTabControl.h
//  YinKe
//
//  Created by 粒子财富 on 16/6/16.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJTabBar.h"

typedef void (^ItemArrayBlock) (NSArray <WJTabbarItem *>* array);

@interface WJTabControl : UITabBarController

//自定义标签的参数，可以添加在标签上可以修改参数
- (void)changeItemForItemArray:(ItemArrayBlock)array;

@end
