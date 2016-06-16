//
//  WJTabControl.m
//  YinKe
//
//  Created by 粒子财富 on 16/6/16.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import "WJTabBarControl.h"
#define tabBarHeight 50

@interface WJTabBarControl () {
    CGRect _rect;
}

@property (nonatomic,strong)WJTabBar *wj_tabBar;
@property (nonatomic,copy)NSArray *controlArray;
@property (nonatomic,copy)NSArray <WJTabbarItem *>*itemArray;

@end

@implementation WJTabBarControl

#pragma mark - 懒加载

- (WJTabBar *)wj_tabBar {
    if (!_wj_tabBar) {
        _wj_tabBar = [WJTabBar new];
        _wj_tabBar.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds)-tabBarHeight, CGRectGetWidth(self.view.bounds), tabBarHeight);
        _rect = _wj_tabBar.frame;
    }
    return _wj_tabBar;
}

- (NSArray *)itemArray {
    if (!_itemArray) {
        NSMutableArray *mutable = [NSMutableArray array];
        [self.controlArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            WJTabbarItem *item = [[WJTabbarItem alloc]init];
            [mutable addObject:item];
        }];
        _itemArray = mutable;
    }
    return _itemArray;
}

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.hidden = YES;
    [self.view addSubview:self.wj_tabBar];
    [self addEvent];
}

#pragma mark - 添加事件

- (void)addEvent {
    [self tabBarSelectItemEvent];
}

//block回调出去
- (void)changeItemForItemArray:(ItemArrayBlock)array {
    array(self.itemArray);
}

#pragma mark - 事件监听

- (void)tabBarSelectItemEvent {
    __weak WJTabBarControl *myself = self;
    [self.wj_tabBar setButtonIndexBlock:^(NSInteger index) {
        myself.selectedIndex = index;
    }];
}

#pragma mark - public

- (void)selectControlAtIndex:(NSInteger)index{
    [self.wj_tabBar selectItemAtIndex:index];
    self.selectedIndex = index;
}

#pragma mark - setter 

//重写设置控制器方法
- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    [super setViewControllers:viewControllers];
    self.controlArray = viewControllers;
    self.wj_tabBar.items = self.itemArray;
}

- (void)tabBarShow {
    [UIView animateWithDuration:0.2 animations:^{
        self.wj_tabBar.frame = _rect;
    }];
}

- (void)tabBarHidden {
    [UIView animateWithDuration:0.2 animations:^{
        self.wj_tabBar.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds), CGRectGetWidth(self.view.bounds), tabBarHeight);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
