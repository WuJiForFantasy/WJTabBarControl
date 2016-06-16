//
//  WJTabBar.h
//  YinKe
//
//  Created by 粒子财富 on 16/6/16.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJTabbarItem.h"
@interface WJTabBar : UIView

@property (nonatomic,strong)NSArray <WJTabbarItem *>*items; //标签数组
@property (nonatomic,copy) void(^buttonIndexBlock)(NSInteger buttonIndex);//block属性

@end
