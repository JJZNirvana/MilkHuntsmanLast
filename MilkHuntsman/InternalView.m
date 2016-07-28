//
//  InternalView.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/16.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "InternalView.h"

@implementation InternalView
- (NSMutableArray *)internalCityArr
{
    if (_internalCityArr == nil) {
        _internalCityArr = [NSMutableArray array];
    }
    return _internalCityArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addAllViews];
    }
    return self;
}
- (void)addAllViews
{
    self.backgroundColor = [UIColor whiteColor];
    _internalTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStylePlain)];
    _internalTableView.dataSource = self;
    _internalTableView.delegate = self;
    [self addSubview:_internalTableView];
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor cyanColor];
    cell.textLabel.text = @"北京";
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    tableView.backgroundColor = [UIColor clearColor];
    NSString *string = @"全部城市";
    return string;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
