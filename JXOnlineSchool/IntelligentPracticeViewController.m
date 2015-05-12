//
//  IntelligentPracticeViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/5/12.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "IntelligentPracticeViewController.h"

@interface IntelligentPracticeViewController ()
@property (strong, nonatomic) UIScrollView *pictureScrollView;
@end

@implementation IntelligentPracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray  *pictureArray = @[@"start",@"start1",@"start2"];
    
    self.pictureScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-80)];
    self.pictureScrollView.bounces = NO;
    self.pictureScrollView.pagingEnabled = YES;
    self.pictureScrollView.showsVerticalScrollIndicator =  NO;
    self.pictureScrollView.showsHorizontalScrollIndicator = NO;
    self.pictureScrollView.userInteractionEnabled = YES;
    [self.view addSubview:self.pictureScrollView];
    self.pictureScrollView.backgroundColor = [UIColor whiteColor];
    self.pictureScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * pictureArray.count, 0);
    
    
    for (int i = 1; i<=pictureArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width *(i-1), 0, self.view.frame.size.width, self.view.frame.size.height)];
        imageView.backgroundColor = [UIColor orangeColor];
        imageView.image = [UIImage imageNamed:pictureArray[i-1]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        if (i == 3) {
             imageView.backgroundColor = [UIColor lightGrayColor];
        }
        [self.pictureScrollView addSubview:imageView];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
