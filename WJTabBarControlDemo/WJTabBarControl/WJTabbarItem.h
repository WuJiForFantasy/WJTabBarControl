//
//  WJTabbarItem.h
//  YinKe
//
//  Created by 粒子财富 on 16/6/16.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, WJTabbarItemStyle) {
    WJTabbarItemStyleNone,          //没有
    WJTabbarItemStyleText,          //文字
    WJTabbarItemStyleImage,         //图片
    WJTabbarItemStyleTextAndImage   //文字和图片（类似系统）
};

@interface WJTabbarItem : UIControl

@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,assign)WJTabbarItemStyle style; //样式

@property (nonatomic,assign)CGFloat itemHeight;//计算高度使用

//改变点击效果
- (void)selectAnimation:(BOOL)selected;

@end
