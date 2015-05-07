//
//  LocationViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/5/6.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()
@property (nonatomic, strong) NSArray *provinces;
@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSMutableArray *states;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityTableView.hidden = YES;
    [self fecthData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.cityTableView) {
        return [self.cities count];
    }else if (tableView == self.customTableView) {
        return [self.states count];
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
        text = self.cities[indexPath.row];
    }else if (tableView == self.customTableView) {
        text = self.states[indexPath.row];
    }

    cell.textLabel.text = text;
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.cityTableView) {
    } else if (tableView == self.customTableView) {
       
        self.customTableView.frame = CGRectMake(0, 0, 112, kScreenHeight);
        self.cityTableView.hidden = NO;
         self.cities = [[self.provinces objectAtIndex:indexPath.row] objectForKey:@"cities"];
        [self.cityTableView reloadData];
    }

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
#pragma mark -private method
- (void)fecthData{
    self.states = [NSMutableArray array];
    self.provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"city.plist" ofType:nil]];
   
    for (NSDictionary *dict in self.provinces) {
        [self.states addObject:[dict objectForKey:@"state"]];
    }
    [self.customTableView reloadData];
}
@end
