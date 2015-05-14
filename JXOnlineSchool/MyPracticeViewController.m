//
//  MyPracticeViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/5/12.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "MyPracticeViewController.h"

@interface MyPracticeViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *iconArray;
@property (nonatomic, strong) NSArray *resultArray;
@end

@implementation MyPracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"笔记本题目",@"收藏",@"练习历史",@"错题集",@"错题练习",@"二维码扫描"];
    self.iconArray =@[@"myPractise_biji_pic",@"myPractise_biji_pic",@"myPractise_biji_pic",@"myPractise_biji_pic",@"myPractise_biji_pic",@"myPractise_biji_pic"];
    self.resultArray=@[@"0道",@"1道",@"3次",@"2道",@"2道",@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"titleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
        
    }
    // Set up the cell.
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:self.iconArray[indexPath.row]];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
