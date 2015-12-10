//
//  ViewController.m
//  圆btn
//
//  Created by qingyun on 15/12/9.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *big;
@property (nonatomic)BOOL isShow;//默认NO
@property (nonatomic, strong)UIButton *button;

@property (nonatomic, assign)CGFloat d;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.big.layer.cornerRadius = 50;
    self.big.center = self.view.center;

    _d = 100;
}
- (IBAction)big:(UIButton *)sender {
    //5个button放在6个区域
    //平分之后的角度,弧度制，因为sinf、cosf需要弧度制
    CGFloat degree = (180/5)*(M_PI/180);
    
    CGPoint originPoint = self.big.center;
    
    if ((self.isShow == NO)) {
        [self.btns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = obj;
            btn.layer.cornerRadius = 20;
            //动画目标位置
            CGFloat cosDegree = cosf(degree * (idx + .5));
            CGFloat sinDegree = sinf(degree * (idx + .5));
            
            CGPoint center = CGPointMake(originPoint.x + _d*cosDegree, originPoint.y - _d*sinDegree);
            NSLog(@"centers:%@",NSStringFromCGPoint(center));

            [UIView animateWithDuration:.5 animations:^{
                btn.center = center;
            } completion:^(BOOL finished) {
            }];
        }];
        self.isShow = YES;
        return;
    }
    [self.btns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = obj;
        btn.layer.cornerRadius = 20;
        [UIView animateWithDuration:.5 animations:^{
            btn.center = self.big.center;
        } completion:^(BOOL finished) {
        }]; 
    }];
    self.isShow = NO;
}
- (IBAction)menu:(UIButton *)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
