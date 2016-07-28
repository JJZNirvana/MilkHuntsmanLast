//
//  RecommendSearchViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendSearchViewController.h"

@interface RecommendSearchViewController ()
@property (nonatomic, strong)UISearchBar *searchBar;
@end

@implementation RecommendSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemCancel) target:self action:@selector(leftAction)];
    [self addAllViews];
    
}

- (void)leftAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addAllViews
{
    
    self.view.backgroundColor = [UIColor colorWithRed:0.936 green:0.941 blue:0.936 alpha:1.000];
    
   
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.164 green:0.657 blue:0.915 alpha:1.000]];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(80, 0, WindownWidth - 120, 44)];

    [self.navigationController.navigationBar addSubview:self.searchBar];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.searchBar removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
