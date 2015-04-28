//
//  MainViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/10.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "MainViewController.h"
#import "LatestViewController.h"
#import "CourseViewController.h"
#import "CourseDetailViewController.h"
#import "SliderViewController.h"
#import "CourseTableViewCell.h"
#import "SearchController.h"

@interface MainViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.dataArray = @[@"快速智能练习",@"专项智能练习",@"组卷模考",@"真题模考",@"全真模考",@"能力评估报告"];
    [self initSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method
- (void)initSubviews{
    
    CGFloat heigt = 24;
    
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 66)];
    headerV.backgroundColor = kCyColorFromRGB(35, 181, 236);
    [self.view addSubview:headerV];
   
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, heigt, 40, 40);
    leftBtn.backgroundColor = [UIColor redColor];
    leftBtn.layer.cornerRadius = leftBtn.frame.size.width/2;
    leftBtn.layer.masksToBounds = YES;
    [leftBtn setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    [headerV addSubview:leftBtn];
    
    leftBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            [[SliderViewController sharedSliderController]showLeftViewController];
        return [RACSignal empty];
    }];
    
    
    UILabel *lb1= [[UILabel alloc] initWithFrame:CGRectMake(leftBtn.frame.size.width + 15 +leftBtn.frame.origin.x, 6, 80, 40)];
    lb1.text = @"英语四六级";
    lb1.textAlignment = NSTextAlignmentCenter;
    lb1.font = [UIFont systemFontOfSize:20];
    lb1.textColor =  kCyColorFromRGB(255, 253, 254);
    lb1.backgroundColor = [UIColor clearColor];
    lb1.center = CGPointMake(lb1.center.x, leftBtn.center.y);
    [headerV addSubview:lb1];
    
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(kScreenWidth-42, heigt, 40, 40);
    searchBtn.backgroundColor = [UIColor orangeColor];
    [searchBtn setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    searchBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        return [RACSignal empty];
    }];

    [headerV addSubview:searchBtn];
    
    searchBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal empty];
    }];
    
    
    UILabel *lb= [[UILabel alloc] initWithFrame:CGRectMake(60, 100, 80, 40)];
    lb.text = @"英语四六级";
    lb.textAlignment = NSTextAlignmentCenter;
    lb.font = [UIFont systemFontOfSize:20];
    lb.textColor =  kCyColorFromRGB(255, 253, 254);
    lb.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lb];

    
    UIButton *lastestBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lastestBtn.frame = CGRectMake(0,180, 80, 80);
    lastestBtn.backgroundColor = [UIColor redColor];
    [lastestBtn setTitle:@"最新课程" forState:UIControlStateNormal];
    [lastestBtn setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    [lastestBtn setImageEdgeInsets: UIEdgeInsetsMake(0, -8, 0, 0)];
    [self.view addSubview:lastestBtn];
    lastestBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal empty];
    }];

    
    
    UIButton *courseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    courseBtn.frame = CGRectMake(kScreenWidth/2+4, 150, 80, 80);
    courseBtn.backgroundColor = [UIColor orangeColor];
    [courseBtn setTitle:@"课程分类" forState:UIControlStateNormal];
    [courseBtn setImageEdgeInsets: UIEdgeInsetsMake(0, -8, 0, 0)];
    [courseBtn setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    [self.view addSubview:courseBtn];
    courseBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal empty];
    }];

    
}

@end
