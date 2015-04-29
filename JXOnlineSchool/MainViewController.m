//
//  MainViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/10.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "MainViewController.h"
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
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bg.backgroundColor = [UIColor clearColor];
    bg.image = [UIImage imageNamed:@"home_960_pic"];
    [self.view addSubview:bg];
    
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 66)];
    headerV.backgroundColor = kCyColorFromRGB(35, 181, 236);
    [self.view addSubview:headerV];
   
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, heigt, 40, 40);
    leftBtn.backgroundColor = [UIColor clearColor];
    leftBtn.layer.cornerRadius = leftBtn.frame.size.width/2;
    leftBtn.layer.masksToBounds = YES;
    [leftBtn setImage: [UIImage imageNamed: @"home_left_btn"] forState: UIControlStateNormal];
    [headerV addSubview:leftBtn];
    
    leftBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            [[SliderViewController sharedSliderController]showLeftViewController];
        return [RACSignal empty];
    }];
    
    
    UILabel *lb1= [[UILabel alloc] initWithFrame:CGRectMake(leftBtn.frame.size.width + 15 +leftBtn.frame.origin.x, 6, 100, 40)];
    lb1.text = @"英语四六级";
    lb1.textAlignment = NSTextAlignmentCenter;
    lb1.font = [UIFont systemFontOfSize:20];
    lb1.textColor =  [UIColor blackColor];
    lb1.backgroundColor = [UIColor clearColor];
    lb1.center = CGPointMake(lb1.center.x, leftBtn.center.y);
    [headerV addSubview:lb1];
    
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(kScreenWidth-42, heigt, 40, 40);
    searchBtn.backgroundColor = [UIColor clearColor];
    [searchBtn setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    searchBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        return [RACSignal empty];
    }];

    [headerV addSubview:searchBtn];
    
    searchBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal empty];
    }];
    
    
    UILabel *lb= [[UILabel alloc] initWithFrame:CGRectMake(40, headerV.frame.size.height + 25, 110, 20)];
    lb.text = @"英语四六级";
    lb.textAlignment = NSTextAlignmentCenter;
    lb.font = [UIFont systemFontOfSize:20];
    lb.textColor =  kCyColorFromRGB(255, 253, 254);
    lb.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lb];

    
    NSInteger width = 85;
    NSInteger height = 90;
    NSInteger buttonTag = 100;
    NSArray *icons = @[@"home_3_default",@"home_2_default",@"home_1_default",@"home_0_default",@"home_9_default",@"home_5_default"];
    for (int i = 0; i<self.dataArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        NSInteger y = 140;
        if (i>=0&&i<=1) {
            y = 140;
        }else if (i>1&&i<=3){
            y=140+height+50;
        }else if(i>3&&i<=5){
            y=140*2+height+50;
        }
        button.frame = CGRectMake((i%2)*(width+60)+60,y, width, height);
        button.backgroundColor = [UIColor clearColor];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        button.tag = buttonTag +i;
        button.titleLabel.textColor = [UIColor blackColor];
        [button setTitle:self.dataArray[i] forState:UIControlStateNormal];
        [button setImage: [UIImage imageNamed: icons[i]] forState: UIControlStateNormal];
        [button setImageEdgeInsets: UIEdgeInsetsMake(-8, 10, 0, 0)];
        [button setTitleEdgeInsets: UIEdgeInsetsMake(0, -74, -74, -10)];
        [self.view addSubview:button];
        button.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            UIButton *sender = (UIButton *)input;
            switch (sender.tag) {
                case 100:
                {
                    
                }
                    break;
                case 101:
                {
                    
                }
                    break;
                case 102:
                {
                    
                }
                    break;
                case 103:
                {
                    
                }
                    break;
                case 104:
                {
                    
                }
                    break;
                case 105:
                {
                    
                }
                    break;
                    
                default:
                    break;
            }
            return [RACSignal empty];
        }];
  
    }

    
}

@end
