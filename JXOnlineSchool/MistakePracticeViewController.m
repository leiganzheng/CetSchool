//
//  DownLoadViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "MistakePracticeViewController.h"
#define kCellHeight 88

typedef enum {
    kDownloading = 0,//正在下载
    kDownloaded = 1,//已经下载
} DownloadType;

@interface MistakePracticeViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *dataArrayDownloaded;
@property (nonatomic, strong) NSArray *dataArrayDetail;
@property (nonatomic,assign) DownloadType type;
@property (weak, nonatomic) IBOutlet UILabel *lineLB;
@property (weak, nonatomic) IBOutlet UIButton *downedButton;
@property (weak, nonatomic) IBOutlet UIButton *downingButton;
@property (weak, nonatomic) IBOutlet UITableView *customTableview;
@end

@implementation MistakePracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"2015年二级建造师报导入课--为什么学习二级建造师",@"2015年二级建造师报导入课--为什么学习二级建造师"];
     self.dataArrayDownloaded = @[@"2013年二级建造师报导入课--为什么学习二级建造师"];
    self.dataArrayDetail = @[@"0.0M/0.0M",@"0.0M/0.0M"];
    self.type = kDownloading;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (self.type) {
        case 0:
        {
            return [_dataArray count];
        }
            break;
        case 1:
        {
            return [_dataArrayDownloaded count];
        }
            break;
        default:
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"DownLoad";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
        cell.backgroundColor = kBgColor;
    }
    // Set up the cell.
    switch (self.type) {
        case 0:
        {
        }
            break;
        case 1:
        {
        }
            break;
        default:
            break;
    }

    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - private method
- (IBAction)downLoadingButtonAction:(id)sender {
    UIButton *button = (UIButton *)sender;
     self.downedButton.titleLabel.textColor = kCyColorFromRGB(121, 121, 121);
    self.downingButton.titleLabel.textColor = [UIColor blackColor];
    [UIView animateWithDuration:0.6 animations:^{
        self.lineLB.center = CGPointMake(button.center.x, 42);
    }];
    self.type = kDownloading;
    
    [self.customTableview reloadData];
}
- (IBAction)dowloadedButtonAction:(id)sender {
    UIButton *button = (UIButton *)sender;
    self.downingButton.titleLabel.textColor = kCyColorFromRGB(121, 121, 121);
    self.downedButton.titleLabel.textColor = [UIColor blackColor];
    [UIView animateWithDuration:0.6 animations:^{
        self.lineLB.center = CGPointMake(button.center.x, 42);
    }];
    self.type = kDownloaded;
    [self.customTableview reloadData];
}


@end
