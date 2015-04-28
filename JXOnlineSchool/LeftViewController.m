//
//  LeftViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/10.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "LeftViewController.h"
#import "SettingViewController.h"
#import "MyCollectionViewController.h"
#import "ChangeNicknameViewController.h"
#import "UserCenterViewController.h"

@interface LeftViewController ()
@property (nonatomic, strong) NSArray *settingWords;
@property (nonatomic, strong) NSArray *courseWords;
@property (nonatomic, strong) NSArray *icons;
@property (nonatomic, strong) UITableView *courTableView;
@property (nonatomic, strong) UITableView *settingTableView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kCyColorFromRGB(42, 42, 42);
    self.settingWords = @[@"我的练习",@"排行榜",@"用户中心",@"设置",@"题目搜所"];
    self.icons = @[@"common",@"common",@"common",@"common",@"common"];
    self.courseWords = @[@"英语四级",@"英语六级"];
    [self initSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.courTableView) {
        return _courseWords.count;
    }else if (tableView == self.settingTableView){
        return _settingWords.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        cell.textLabel.textColor = kCyColorFromRGB(210, 210, 210);
        
    }
    // Set up the cell.
    if (tableView == self.courTableView) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.text = _courseWords[indexPath.row];
        cell.backgroundColor = kCyColorFromRGB(29, 76, 145);
    }else if (tableView == self.settingTableView){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.text = _settingWords[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:_icons[indexPath.row]];
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MainBaseViewController *vc = [[MainBaseViewController alloc] init];
    if (tableView == self.settingTableView) {
        switch (indexPath.row) {
            case 0:
            {
                
            }
                break;
            case 1:
            {
                
            }
                break;
            case 2:
            {
                vc = (MainBaseViewController *)[UserCenterViewController CreateFromMainStoryboard];
            }
                break;
                
            case 3:
            {
                vc = (MainBaseViewController *)[SettingViewController CreateFromMainStoryboard];
            }
                break;
            case 4:
            {
                
            }
                break;
                
            default:
                break;
        }
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:^{}];
    }else if (tableView == self.courTableView){
        [[SliderViewController sharedSliderController]showLeftViewController];
    }
}


#pragma mark - Private Method
- (void)initSubviews{
    NSInteger width = 220;
    NSInteger settingTableHeight = 250;
    self.courTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, width, kScreenHeight-settingTableHeight)];
    self.courTableView.backgroundColor = [UIColor clearColor];
    self.courTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.courTableView.delegate = self;
    self.courTableView.dataSource = self;
    [self.view addSubview:self.courTableView];
    
    self.settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kScreenHeight-settingTableHeight+20, width, settingTableHeight)];
    self.settingTableView.backgroundColor = [UIColor clearColor];
    self.settingTableView.delegate = self;
    self.settingTableView.dataSource = self;
    [self.view addSubview:self.settingTableView];
}


@end
