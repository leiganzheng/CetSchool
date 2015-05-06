//
//  LocationViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/5/6.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()
@property (nonatomic, strong) NSArray *settingWords;
@property (nonatomic, strong) NSArray *cityWords;
@property (nonatomic, strong) NSArray *provinces;
@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSArray *states;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settingWords = @[@"河南",@"北京",@"武汉"];
    self.cityWords = @[@"河南",@"北京",@"武汉"];
    self.cityTableView.hidden = YES;
    self.provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"city.plist" ofType:nil]];
    self.cities = [[self.provinces objectAtIndex:0] objectForKey:@"cities"];
    self.states = [[self.provinces objectAtIndex:0] objectForKey:@"state"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.cityTableView) {
        return [_cityWords count];
    }else if (tableView == self.customTableView) {
        return [_settingWords count];
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
        cell.textLabel.textColor = kCyColorFromRGB(121, 121, 121);
    }
    // Set up the cell.
    NSString *text;
    if (tableView == self.cityTableView) {
        text = _cityWords[indexPath.row];
    }else if (tableView == self.customTableView) {
        text = _settingWords[indexPath.row];
    }

    cell.textLabel.text = text;
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.cityTableView) {
    } else if (tableView == self.customTableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        self.customTableView.frame = CGRectMake(0, 0, 112, kScreenHeight);
        self.cityTableView.hidden = NO;
        [self.cityTableView reloadData];
    }

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
