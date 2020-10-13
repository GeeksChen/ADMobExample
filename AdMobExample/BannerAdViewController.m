//
//  BannerAdViewController.m
//  AdMobExample
//
//  Created by GeekChen on 2020/10/13.
//  Copyright © 2020 MJDev. All rights reserved.
//

#import "BannerAdViewController.h"
@import GoogleMobileAds;

@interface BannerAdViewController ()<GADBannerViewDelegate>

@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation BannerAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Banner广告";
    
    // In this case, we instantiate the banner with desired ad size.
    self.bannerView = [[GADBannerView alloc]
      initWithAdSize:kGADAdSizeBanner];
    self.bannerView.delegate = self;
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self addBannerViewToView:self.bannerView];
   
    [self.bannerView loadRequest:[GADRequest request]];

}

- (void)addBannerViewToView:(UIView *)bannerView {
    
  bannerView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:bannerView];
  [self.view addConstraints:@[
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeBottom
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.bottomLayoutGuide
                               attribute:NSLayoutAttributeTop
                              multiplier:1
                                constant:0],
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeCenterX
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.view
                               attribute:NSLayoutAttributeCenterX
                              multiplier:1
                                constant:0]
                                ]];
}

/// Tells the delegate an ad request loaded an ad.
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
  NSLog(@"adViewDidReceiveAd");
}

/// Tells the delegate an ad request failed.
- (void)adView:(GADBannerView *)adView
    didFailToReceiveAdWithError:(GADRequestError *)error {
  NSLog(@"adView:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

/// Tells the delegate that a full-screen view will be presented in response
/// to the user clicking on an ad.
- (void)adViewWillPresentScreen:(GADBannerView *)adView {
  NSLog(@"adViewWillPresentScreen");
}

/// Tells the delegate that the full-screen view will be dismissed.
- (void)adViewWillDismissScreen:(GADBannerView *)adView {
  NSLog(@"adViewWillDismissScreen");
}

/// Tells the delegate that the full-screen view has been dismissed.
- (void)adViewDidDismissScreen:(GADBannerView *)adView {
  NSLog(@"adViewDidDismissScreen");
}

/// Tells the delegate that a user click will open another app (such as
/// the App Store), backgrounding the current app.
- (void)adViewWillLeaveApplication:(GADBannerView *)adView {
  NSLog(@"adViewWillLeaveApplication");
}


@end
