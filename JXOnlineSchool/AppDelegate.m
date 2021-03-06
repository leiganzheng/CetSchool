//
//  AppDelegate.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/10.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftViewController.h"
#import "MainViewController.h"
#import "StartViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor =  kCyColorFromRGB(35, 181, 236);
    
    do {
//        [UIApplication sharedApplication].statusBarHidden = YES;
//        StartViewController *VC = [[StartViewController alloc] init];
//        self.window.rootViewController = VC;
//        VC.finish = ^(){
            [self mainView];
//        };
    }while (NO);
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Private method

- (void)mainView{
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    [SliderViewController sharedSliderController].LeftVC = leftVC;
    [SliderViewController sharedSliderController].MainVC = [[MainViewController alloc] init];
    [SliderViewController sharedSliderController].LeftSContentOffset=220;
    [SliderViewController sharedSliderController].LeftContentViewSContentOffset = 90;
    [SliderViewController sharedSliderController].LeftSContentScale=0.77;
    [SliderViewController sharedSliderController].LeftSJudgeOffset=160;
    [SliderViewController sharedSliderController].changeLeftView = ^(CGFloat sca, CGFloat transX)
    {};
    
    [UIViewController validatePanPackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypePan];
    
    
    UINavigationController *naviC = [[UINavigationController alloc] initWithRootViewController:[SliderViewController sharedSliderController]];
    do {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
        [UINavigationBar appearance].tintColor = [UIColor blackColor];
        NSDictionary *dict=[NSDictionary dictionaryWithObjects:
                            [NSArray arrayWithObjects:kCyColorFromRGB(0, 0, 0),[UIFont boldSystemFontOfSize:20],nil]
                                                       forKeys:
                            [NSArray arrayWithObjects:NSForegroundColorAttributeName,NSFontAttributeName,nil]];
        [UINavigationBar appearance].titleTextAttributes = dict;
    } while(NO);
    self.window.rootViewController = [SliderViewController sharedSliderController];
    [self animationWithVC:[SliderViewController sharedSliderController]];
}

- (void)animationWithVC:(UIViewController *)vc{
    // 转场动画过渡
    UIView *view = [[UIScreen mainScreen] snapshotViewAfterScreenUpdates:NO];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController = vc; // 如果不需要动画，直接执行这个就好了
    [[appDelegate window] addSubview:view];
    [UIView animateWithDuration:0.5 animations:^{
        view.transform = CGAffineTransformMakeScale(3.0, 3.0);
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}

@end
