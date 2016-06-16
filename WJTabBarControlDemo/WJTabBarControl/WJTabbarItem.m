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
    self.label = [UILabel new];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:15];
    self.label.text = @"item";
    [self addSubview:self.label];
    
    self.imageView = [[UIImageView alloc]init];
    self.imageView.image = [UIImage imageNamed:@"git"];
    [self addSubview:self.imageView];
    self.label.hidden = YES;
}


- (void)layoutSubviews {
    self.label.frame = self.bounds;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    self.imageView.frame = CGRectMake(width/2-height*0.3, height *0.2, height*0.6, height *0.6);
}


- (void)setHideText:(BOOL)hideText {
    _hideText = hideText;
    self.label.hidden = hideText;
}

@end
