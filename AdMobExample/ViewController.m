//
//  ViewController.m
//  AdMobExample
//
//  Created by GeekChen on 2020/10/13.
//  Copyright © 2020 MJDev. All rights reserved.
//

#import "ViewController.h"
#import "InterstitialViewController.h"
#import "RewardedAdViewController.h"
#import "BannerAdViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"ADMob";

    CGFloat width = self.view.frame.size.width - 20;
    CGFloat height = 50;
    [self.view addSubview:[self customBtnWithFrame:CGRectMake(10, 100, width, height) withTitle:@"Banner广告" withSel:@selector(ADVAction:) withtag:(1001)]];
    [self.view addSubview:[self customBtnWithFrame:CGRectMake(10, 160, width, height) withTitle:@"插页广告" withSel:@selector(ADVAction:) withtag:(1002)]];
    [self.view addSubview:[self customBtnWithFrame:CGRectMake(10, 220, width, height) withTitle:@"激励广告" withSel:@selector(ADVAction:) withtag:(1003)]];

    
}

- (void)ADVAction:(UIButton *)sender {
    switch (sender.tag) {
        case 1001:{
            BannerAdViewController *bannerVC = [BannerAdViewController new];
            [self.navigationController pushViewController:bannerVC animated:YES];
        }
            break;
        case 1002:{
            InterstitialViewController *interstitialVC = [InterstitialViewController new];
            [self.navigationController pushViewController:interstitialVC animated:YES];
        }
            break;
        case 1003:{
            RewardedAdViewController *rewardVC = [RewardedAdViewController new];
            [self.navigationController pushViewController:rewardVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (UIButton *)customBtnWithFrame:(CGRect)frame withTitle:(NSString *)title withSel:(SEL)selector withtag:(NSInteger)tag{
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setBackgroundColor:[UIColor redColor]];
    btn.tag = tag;
    btn.frame = frame;
    [btn addTarget:self action:selector forControlEvents:(UIControlEventTouchUpInside)];
    return btn;
}
@end
