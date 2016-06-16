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
@property (nonatomic,strong)NSMutableArray *linArray;

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
    self.backgroudView = [UIView new];
    self.backgroudView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.backgroudView];
    
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
    [self.linArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake((idx+1)*self.itemWidth, 10, 1, frameSize.height-20);
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
    _linArray = [NSMutableArray array];
    [items enumerateObjectsUsingBlock:^(WJTabbarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj addTarget:self action:@selector(tabBarItemWasSelected:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:obj];
        if (idx > 0) {
            UIView *line = [UIView new];
            line.backgroundColor = [UIColor lightGrayColor];
            [self addSubview:line];
            [_linArray addObject:line];
        }else {
//            obj.label.textColor = [UIColor lightGrayColor];
            obj.alpha = 1;
        }
    }];
    
}

#pragma mark - 事件监听

- (void)tabBarItemWasSelected:(WJTabbarItem *)sender {
    sender.alpha = 0.2;
    __block NSInteger index = 0;
    [self.items enumerateObjectsUsingBlock:^(WJTabbarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == sender) {
            [UIView animateWithDuration:0.5 animations:^{
//                obj.label.textColor = [UIColor lightGrayColor];
                obj.alpha = 1;
            }];
            index = idx;
        }else {
            [UIView animateWithDuration:0.5 animations:^{
//                obj.label.textColor = [UIColor blackColor];
                obj.alpha = 1;
            }];
        }
    }];
    self.buttonIndexBlock(index);
}


@end
