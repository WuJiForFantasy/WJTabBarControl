//
//  ViewController.m
//  WJTabBarControlDemo
//
//  Created by 粒子财富 on 16/6/16.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+WJTabBarControl.h"
#import "TwoViewController.h"
@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    CAShapeLayer *shaplayer = [CAShapeLayer layer];
    shaplayer.strokeColor = [UIColor yellowColor].CGColor;
    shaplayer.fillColor = [UIColor whiteColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:100 startAngle:M_PI endAngle:M_PI *2  clockwise:YES];
    shaplayer.path = path.CGPath;
    [self.view.layer addSublayer:shaplayer];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.navigationController) {
        [self tabBarHidden];
        TwoViewController *two = [[TwoViewController alloc]init];
        [self.navigationController pushViewController:two animated:YES];
    }
  
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self tabBarShow];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
