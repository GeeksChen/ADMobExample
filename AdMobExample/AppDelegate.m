//
//  AppDelegate.m
//  AdMobExample
//
//  Created by GeekChen on 2020/10/13.
//  Copyright © 2020 MJDev. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@import GoogleMobileAds;

@interface AppDelegate ()

@end

@implementation AppDelegate

/*
 ADMob首页：https://apps.admob.com/v2/home
 
 申请广告位：https://apps.admob.com/v2/apps/2515987164/adunits/create?utm_medium=et&utm_source=internal&utm_campaign=2019-admob-gbl-helpcentre-sign-up-for-admob&pli=1
 
 测试广告位ID：https://developers.google.com/admob/ios/test-ads
 
 接入广告文档：https://developers.google.com/admob/ios/quick-start
  */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [[GADMobileAds sharedInstance] startWithCompletionHandler:nil];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
