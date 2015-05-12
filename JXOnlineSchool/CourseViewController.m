//
//  CourseViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/5/6.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "CourseViewController.h"

@interface CourseViewController ()
@property (nonatomic, strong) NSArray *settingWords;
@property (weak, nonatomic) IBOutlet UITableView *customTable;

@end

@implementation CourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settingWords = @[@"英语四级",@"英语六级"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_settingWords count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
        return @"请选择练习科目，可多选";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];     if (cell == nil)
    {
        // Use the default cell style.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        cell.textLabel.textColor = kCyColorFromRGB(121, 121, 121);
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    // Set up the cell.
    UIImageView *imge = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22, 20)];
    imge.backgroundColor = [UIColor clearColor];
    imge.image = [UIImage imageNamed:@"exam_selected"];
    cell.accessoryView = imge;
    
    cell.textLabel.text = _settingWords[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
