//
//  ListViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/5/12.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "ListViewController.h"

#define kCellHeight 88

typedef enum {
    kDownloading = 0,//正在下载
    kDownloaded = 1,//已经下载
} DownloadType;

@interface ListViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *dataArrayDownloaded;
@property (nonatomic,assign) DownloadType type;
@property (weak, nonatomic) IBOutlet UILabel *lineLB;
@property (weak, nonatomic) IBOutlet UIButton *downedButton;
@property (weak, nonatomic) IBOutlet UIButton *downingButton;
@property (weak, nonatomic) IBOutlet UILabel *customTitle;
@property (weak, nonatomic) IBOutlet UITableView *customTableview;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"1",@"2",@"3",@"4",@"5"];
    self.dataArrayDownloaded = @[@"1",@"2",@"3",@"4",@"5"];
    self.type = kDownloading;
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    v.backgroundColor = [UIColor redColor];
    self.customTableview.tableHeaderView = v;
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
    static NSString *MyIdentifier = @"Load";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    }
    // Set up the cell.
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
    return 44;
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

