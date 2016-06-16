//
//  WJTabbarItem.h
//  YinKe
//
//  Created by 粒子财富 on 16/6/16.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJTabbarItem : UIControl

@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)UIImageView *imageView;
//@property (nonatomic,strong)
@property (nonatomic,assign)CGFloat itemHeight;//计算高度使用

@property (nonatomic,assign)BOOL hideText;//隐藏文字

@end
