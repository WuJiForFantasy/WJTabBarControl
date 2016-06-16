//
//  WJTabBar.m
//  YinKe
//
//  Created by 粒子财富 on 16/6/16.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import "WJTabBar.h"

@interface WJTabBar ()

@property (nonatomic,assign)CGFloat itemWidth;
@property (nonatomic,strong)UIView *backgroudView;
@property (nonatomic,strong)CAShapeLayer *linelayer;
@property (nonatomic,strong)CAShapeLayer *roundLayer;
@end

@implementation WJTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
  
    [self addLineView];
    [self addRoundView];
    self.backgroudView = [UIView new];
    [self addSubview:self.backgroudView];
    
    self.backgroudColor = [UIColor lightGrayColor];
    self.lineColor = [UIColor yellowColor];
    self.showRound = YES;
}

- (void)addLineView {
    self.linelayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds), 0)];
    [path closePath];
    self.linelayer.path = path.CGPath;
    [self.layer addSublayer:self.linelayer];
}

- (void)addRoundView {
    self.roundLayer = [CAShapeLayer layer];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds)/2, 50/2) radius:40 startAngle:M_PI endAngle:M_PI+M_PI clockwise:YES];
    self.roundLayer.path = path1.CGPath;
    [self.layer addSublayer:self.roundLayer];
}

- (void)layoutSubviews {
    CGSize frameSize = self.frame.size;
    
    self.backgroudView.frame = CGRectMake(0, 0, frameSize.width, frameSize.height);
    self.itemWidth = frameSize.width/self.items.count;
    
    [self.items enumerateObjectsUsingBlock:^(WJTabbarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat itemHeight = item.itemHeight;
        if (!itemHeight) {
            itemHeight = frameSize.height;
        }
        item.frame = CGRectMake(idx*self.itemWidth, 0, self.itemWidth, itemHeight);
    }];

}

#pragma mark - Configuration

- (void)setItemWidth:(CGFloat)itemWidth {
    if (itemWidth > 0) {
        _itemWidth = itemWidth;
    }
}

- (void)setItems:(NSArray<WJTabbarItem *> *)items {
    [items enumerateObjectsUsingBlock:^(WJTabbarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    _items = [items copy];
    [items enumerateObjectsUsingBlock:^(WJTabbarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj addTarget:self action:@selector(tabBarItemWasSelected:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:obj];
        if (idx == 0) {
           obj.selected = YES;
        }
    }];
    
}

#pragma mark - 事件监听

- (void)tabBarItemWasSelected:(WJTabbarItem *)sender {
    __block NSInteger index = 0;
    [self.items enumerateObjectsUsingBlock:^(WJTabbarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == sender) {
            obj.selected = YES;
            index = idx;
        }else {
            obj.selected = NO;
        }
    }];
    self.buttonIndexBlock(index);
}

#pragma mark - public

- (void)selectItemAtIndex:(NSInteger)index {
    __block NSInteger inter = 0;
    [self.items enumerateObjectsUsingBlock:^(WJTabbarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (inter == index) {
            obj.selected = YES;
        }else {
            obj.selected = NO;
        }
        inter ++;
    }];
}

#pragma mark - seter 

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    self.linelayer.strokeColor = lineColor.CGColor;
    self.roundLayer.strokeColor = lineColor.CGColor;
}

- (void)setBackgroudColor:(UIColor *)backgroudColor {
    _backgroudColor = backgroudColor;
    self.backgroudView.backgroundColor = backgroudColor;
    self.roundLayer.fillColor = backgroudColor.CGColor;
}

- (void)setShowRound:(BOOL)showRound {
    _showRound = showRound;
    self.roundLayer.hidden = !showRound;
}

@end
