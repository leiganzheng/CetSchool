//
//  UserCenterViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/28.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "UserCenterViewController.h"

@interface UserCenterViewController ()

@property (nonatomic, strong) NSArray *settingWords;
@end

@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settingWords = @[@[@"00"], @[@"通知",@"消息"],@[@"修改个人资料",@"报考地",@"考试科目"],@[@"我的提问",@"我的回答"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _settingWords.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_settingWords[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        static NSString *MyIdentifier = @"userCellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil)
        {
            // Use the default cell style.
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        }
        // Set up the cell.
        UIButton *btn = (UIButton *)[cell.contentView viewWithTag:100];
        btn.layer.masksToBounds=YES;
        btn.layer.cornerRadius = btn.bounds.size.width/2;

        return cell;

    }else{
        static NSString *MyIdentifier = @"identifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];     if (cell == nil)
        {
            // Use the default cell style.
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
            cell.textLabel.textColor = kCyColorFromRGB(121, 121, 121);
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        // Set up the cell.
        
        cell.textLabel.text = _settingWords[indexPath.section][indexPath.row];
        return cell;

    }
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0&&indexPath.row == 0) {
        return 126;
    }else {
         return 44;
    }
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




@end
