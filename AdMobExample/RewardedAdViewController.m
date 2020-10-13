//
//  RewardedAdViewController.m
//  AdMobExample
//
//  Created by GeekChen on 2020/10/13.
//  Copyright © 2020 MJDev. All rights reserved.
//

#import "RewardedAdViewController.h"
@import GoogleMobileAds;

@interface RewardedAdViewController ()<GADRewardedAdDelegate>

@property(nonatomic, strong) GADRewardedAd *rewardedAd;//激励广告

@end

@implementation RewardedAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"激励广告";
    //配置激励广告
    //ca-app-pub-5082546344013457/1900570180
    self.rewardedAd = [self createAndLoadRewardedAd];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"展示" style:(UIBarButtonItemStylePlain) target:self action:@selector(showAd)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)showAd {
    //展示激励广告
    if (self.rewardedAd.isReady) {
     [self.rewardedAd presentFromRootViewController:self delegate:self];
    } else {
     NSLog(@"Ad wasn't ready");
    }
}

- (GADRewardedAd *)createAndLoadRewardedAd {
    
  GADRewardedAd *rewardedAd = [[GADRewardedAd alloc]
      initWithAdUnitID:@"ca-app-pub-3940256099942544/1712485313"];
  GADRequest *request = [GADRequest request];
  [rewardedAd loadRequest:request completionHandler:^(GADRequestError * _Nullable error) {
    if (error) {
      // Handle ad failed to load case.
        NSLog(@"%@",error.localizedDescription);
    } else {
      // Ad successfully loaded.
        NSLog(@"Ad successfully loaded.");
    }
  }];
  return rewardedAd;
}

/// Tells the delegate that the user earned a reward.
- (void)rewardedAd:(GADRewardedAd *)rewardedAd userDidEarnReward:(GADAdReward *)reward {
  // TODO: Reward the user.
    NSLog(@"rewardedAd:userDidEarnReward:");
}

/// Tells the delegate that the rewarded ad was presented.
- (void)rewardedAdDidPresent:(GADRewardedAd *)rewardedAd {
    NSLog(@"rewardedAdDidPresent:");
}

/// Tells the delegate that the rewarded ad failed to present.
- (void)rewardedAd:(GADRewardedAd *)rewardedAd didFailToPresentWithError:(NSError *)error {
    NSLog(@"rewardedAd:didFailToPresentWithError");
}

/// Tells the delegate that the rewarded ad was dismissed.
- (void)rewardedAdDidDismiss:(GADRewardedAd *)rewardedAd {
    NSLog(@"rewardedAdDidDismiss:");
    self.rewardedAd = [self createAndLoadRewardedAd];

}

@end
