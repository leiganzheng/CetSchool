//
//  AllMoldTestViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/5/12.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "AllMoldTestViewController.h"

@interface AllMoldTestViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation AllMoldTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"2014",@"2二级建造师",@"2014",@"2014",@"2014",@"2014",@"2014",@"2014",@"2014"];
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
    static NSString *MyIdentifier = @"allcourse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    }
    // Set up the cell.
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
