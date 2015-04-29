//
//  LoginViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/15.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "LeftViewController.h"
#import "MainViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *forgtPassword;
@property (weak, nonatomic) IBOutlet UIButton *newuser;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *qq;
@property (weak, nonatomic) IBOutlet UIButton *sina;
@property (weak, nonatomic) IBOutlet UIButton *renren;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.leftBarButtonItem = nil;
    self.login.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self mainView];
        return [RACSignal empty];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    UINavigationController *nav  = (UINavigationController *)[[[UIApplication sharedApplication]keyWindow] rootViewController];
//    [nav setNavigationBarHidden:NO animated:animated];
//}
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    UINavigationController *nav  = (UINavigationController *)[[[UIApplication sharedApplication]keyWindow] rootViewController];
//    [nav setNavigationBarHidden:YES animated:animated];
//}


//MARK:- Delegate or DataSource

//MARK:- NSNotification Method

//MARK:- Action Method

//MARK:- Private Method
- (void)fetchData{
    
}
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
    
    
//    UINavigationController *naviC = [[UINavigationController alloc] initWithRootViewController:[SliderViewController sharedSliderController]];
    do {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        [UINavigationBar appearance].barTintColor =[UIColor whiteColor];
        [UINavigationBar appearance].tintColor = [UIColor blackColor];
        NSDictionary *dict=[NSDictionary dictionaryWithObjects:
                            [NSArray arrayWithObjects:kCyColorFromRGB(0, 0, 0),[UIFont boldSystemFontOfSize:20],nil]
                                                       forKeys:
                            [NSArray arrayWithObjects:NSForegroundColorAttributeName,NSFontAttributeName,nil]];
        [UINavigationBar appearance].titleTextAttributes = dict;
    } while(NO);
    [[UIApplication sharedApplication] keyWindow].rootViewController = [SliderViewController sharedSliderController];
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
