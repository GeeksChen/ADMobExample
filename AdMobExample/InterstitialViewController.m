//
//  InterstitialViewController.m
//  AdMobExample
//
//  Created by GeekChen on 2020/10/13.
//  Copyright © 2020 MJDev. All rights reserved.
//

#import "InterstitialViewController.h"
@import GoogleMobileAds;

@interface InterstitialViewController ()<GADInterstitialDelegate>

@property(nonatomic, strong) GADInterstitial *interstitial;//插页广告

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"插页广告";
    
    self.interstitial = [self createAndLoadInterstitial];
  
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"展示" style:(UIBarButtonItemStylePlain) target:self action:@selector(showAd)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)showAd {
    
    //展示插页广告
      if (self.interstitial.isReady) {
        [self.interstitial presentFromRootViewController:self];
      } else {
        NSLog(@"Ad wasn't ready");
      }
}

- (GADInterstitial *)createAndLoadInterstitial {
  GADInterstitial *interstitial =
      [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-3940256099942544/5135589807"];
  interstitial.delegate = self;
  [interstitial loadRequest:[GADRequest request]];
  return interstitial;
}

/// Tells the delegate an ad request succeeded.
- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
  NSLog(@"interstitialDidReceiveAd");
}

/// Tells the delegate an ad request failed.
- (void)interstitial:(GADInterstitial *)ad
    didFailToReceiveAdWithError:(GADRequestError *)error {
  NSLog(@"interstitial:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

/// Tells the delegate that an interstitial will be presented.
- (void)interstitialWillPresentScreen:(GADInterstitial *)ad {
  NSLog(@"interstitialWillPresentScreen");
}

/// Tells the delegate the interstitial is to be animated off the screen.
- (void)interstitialWillDismissScreen:(GADInterstitial *)ad {
  NSLog(@"interstitialWillDismissScreen");
}

/// Tells the delegate the interstitial had been animated off the screen.
- (void)interstitialDidDismissScreen:(GADInterstitial *)ad {
    self.interstitial = [self createAndLoadInterstitial];

  NSLog(@"interstitialDidDismissScreen");
}

/// Tells the delegate that a user click will open another app
/// (such as the App Store), backgrounding the current app.
- (void)interstitialWillLeaveApplication:(GADInterstitial *)ad {
  NSLog(@"interstitialWillLeaveApplication");
}
@end
