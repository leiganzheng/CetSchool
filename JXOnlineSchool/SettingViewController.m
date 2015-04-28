//
//  SettingViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "SettingViewController.h"
#import "ChangeNicknameViewController.h"
#import "ChangPasswordViewController.h"
#import "LoginViewController.h"
#import "AboutViewController.h"

#define kCellHeight 44

@interface SettingViewController ()
@property (nonatomic, strong) NSArray *settingWords;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多设置";
    self.settingWords = @[@[@"亲,给个好评",@"意见反馈"], @[@"每日答题提醒",@"夜间模式",@"真题下载"],@[@"清除缓存",@"当前版本"],@[@"应用推荐",@"关于"]];
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320,44)];
    footView.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 280,44);
    btn.backgroundColor = [UIColor redColor];
    btn.titleLabel.textColor = kCyColorFromRGB(255, 255, 255);
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 10;
    btn.center = footView.center;
    btn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[LoginViewController CreateFromMainStoryboard]];
        [[UIApplication sharedApplication] keyWindow].rootViewController = nav;

        return [RACSignal empty];
    }];
    [footView addSubview:btn];
    self.tableView.tableFooterView = footView;
    
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
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 2) {
          return @"下载历年真题试卷资源，可大幅度降低流量消耗，资源包大小为0.00M，已下载OK。";
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];     if (cell == nil)
    {
        // Use the default cell style.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        cell.textLabel.textColor = kCyColorFromRGB(121, 121, 121);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    // Set up the cell.
    if ((indexPath.section == 1 && indexPath.row == 1)||(indexPath.section == 1 && indexPath.row == 2)) {
        UISwitch *notificationSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(265, 0, 20, 10)];
        notificationSwitch.on = YES;
        notificationSwitch.center = CGPointMake(notificationSwitch.center.x, kCellHeight/2);
        [notificationSwitch addTarget:self action:@selector(swichAction:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = notificationSwitch;
        
        UISwitch *notificationSwitch1 = [[UISwitch alloc] initWithFrame:CGRectMake(265, 0, 20, 10)];
        notificationSwitch1.on = YES;
        notificationSwitch1.center = CGPointMake(notificationSwitch.center.x, kCellHeight/2);
        [notificationSwitch1 addTarget:self action:@selector(swichAction:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = notificationSwitch1;
        cell.accessoryType = UITableViewCellAccessoryNone;

    }else if(indexPath.section == 1 && indexPath.row == 0){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = kCyColorFromRGB(0, 0 , 0);
        label.text = @"未开启";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        cell.accessoryView = label;
    }else if(indexPath.section == 2 && indexPath.row == 1){
        cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = kCyColorFromRGB(0, 0 , 0);
        label.text = @"升级到最新版本";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        cell.accessoryView = label;
    }
        cell.textLabel.text = _settingWords[indexPath.section][indexPath.row];
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

#pragma mark - private method


- (void)swichAction:(UISwitch *)sender{
    if (sender.on) {
       
    }else{

    }
}


@end
