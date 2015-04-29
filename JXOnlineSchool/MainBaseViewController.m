//
//  MainBaseViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/21.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "MainBaseViewController.h"
@interface MainBaseViewController ()
@end

@implementation MainBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *home = [UIButton buttonWithType:UIButtonTypeCustom];
    home.frame = CGRectMake(0, 0 ,40, 40);
    home.backgroundColor = [UIColor clearColor];
    [home setImage: [UIImage imageNamed: @"home_back_pic_night"] forState: UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:home];
    home.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        return [RACSignal empty];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

@end
