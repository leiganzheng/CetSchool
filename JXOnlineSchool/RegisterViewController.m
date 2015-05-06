//
//  RegisterViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/21.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "RegisterViewController.h"
#import "CourseViewController.h"
#import "LocationViewController.h"
#import "FinalRegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;
@property (weak, nonatomic) IBOutlet UIButton *courseBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.navigationController pushViewController:[LocationViewController CreateFromMainStoryboard] animated:NO];
        return [RACSignal empty];
    }];
    self.courseBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.navigationController pushViewController:[CourseViewController CreateFromMainStoryboard] animated:NO];
        return [RACSignal empty];
    }];
    self.nextBtn.rac_command  = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.navigationController pushViewController:[FinalRegisterViewController CreateFromMainStoryboard] animated:NO];
        return [RACSignal empty];
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//MARK:- Delegate or DataSource

//MARK:- NSNotification Method

//MARK:- Action Method
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//MARK:- Private Method



@end
