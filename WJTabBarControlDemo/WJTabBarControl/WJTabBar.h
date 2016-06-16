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

@property (nonatomic,strong)UIColor *lineColor;         //线条颜色
@property (nonatomic,strong)UIColor *backgroudColor;    //背景颜色
@property (nonatomic,assign)BOOL showRound;             //显示中间圆弧

//设置选中标签
- (void)selectItemAtIndex:(NSInteger)index;



@end
