//
//  WJTabbarItem.m
//  YinKe
//
//  Created by 粒子财富 on 16/6/16.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import "WJTabbarItem.h"

@implementation WJTabbarItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    

    self.style = WJTabbarItemStyleTextAndImage;
    self.label = [UILabel new];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:15];
    self.label.text = @"item";
    [self addSubview:self.label];
    
    self.imageView = [[UIImageView alloc]init];
    self.imageView.image = [UIImage imageNamed:@"git"];
    [self addSubview:self.imageView];
}


- (void)layoutSubviews {

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    switch (self.style) {
        case WJTabbarItemStyleNone:
            [self hidenDefaut];
            break;
        case WJTabbarItemStyleText:
            self.imageView.hidden = YES;
            self.label.frame = self.bounds;
            break;
        case WJTabbarItemStyleImage:
            self.label.hidden = YES;
            self.imageView.frame = CGRectMake(width/2-height*0.3, height *0.2, height*0.6, height *0.6);
            break;
        case WJTabbarItemStyleTextAndImage:
            self.label.font = [UIFont systemFontOfSize:11];
            self.label.frame = CGRectMake(0,  height *0.7, width,  height *0.2);
            self.imageView.frame = CGRectMake(width/2-height*0.25, height *0.15, height*0.5, height *0.5);
            break;
        default:
            break;
    }
}

#pragma mark - public

- (void)selectAnimation:(BOOL)selected {
    if (selected) {
        self.alpha = 0.2;
        [UIView animateWithDuration:0.5 animations:^{
            self.backgroundColor = [UIColor grayColor];
            self.alpha = 1;
            
        }];
    }else {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.backgroundColor = [UIColor lightGrayColor];
            self.alpha = 1;
        }];
    }
}

- (void)hidenDefaut {
    self.label.hidden = YES;
    self.imageView.hidden = YES;
}

#pragma mark - setter

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self selectAnimation:selected];

}

- (void)setStyle:(WJTabbarItemStyle)style {
    _style = style;
    [self setNeedsLayout];
}

@end
