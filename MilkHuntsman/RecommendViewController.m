//
//  RecommendViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendViewController.h"
#import "RecommendTableViewCell.h"
#import "RecommendView.h"
#import "CityViewController.h"
#import "RecommendClassifyView.h"
#import "RecommendRequest.h"
#import "RecommendModel.h"
#import "RecommendSecondTableViewCell.h"
#import "ThirdTableViewCell.h"
#import "FouthTableViewCell.h"
#import "RecommendSearchViewController.h"
@interface RecommendViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
FirstCellDelegate,
SecondCellDelegate,
ThirdCellDelegate,
ImageViewDelegate
>

@property (strong, nonatomic) UISearchBar *recommendSearchBar;
@property (strong, nonatomic) UIScrollView *recommendScrollView;

@property (weak, nonatomic) IBOutlet UITableView *recommendTableView;


@property (strong, nonatomic) RecommendClassifyView *classifyView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) BOOL isOK;
@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [NSMutableArray array];
    _twoArray = [NSMutableArray array];
    _threeArray = [NSMutableArray array];
//    self.isOK = NO;
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.164 green:0.657 blue:0.915 alpha:1.000]];
    self.dataArray = [NSMutableArray array];
    self.navigationController.navigationBar.translucent = YES;
    self.recommendTableView.delegate = self;
    self.recommendTableView.dataSource = self;
    [self.recommendTableView registerClass:[RecommendTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.recommendTableView registerClass:[RecommendSecondTableViewCell class] forCellReuseIdentifier:@"second"];
    [self.recommendTableView registerClass:[ThirdTableViewCell class] forCellReuseIdentifier:@"third"];
    [self.recommendTableView registerClass:[FouthTableViewCell class] forCellReuseIdentifier:@"fouth"];
    [self addAllViews];

    
//初始化分类视图
    self.classifyView = [RecommendClassifyView new];
    self.classifyView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.classifyView];
    
    
    [self requestRecommend];
    
    [self requestMore];
}

-(void)requestRecommend{
    __weak typeof(self) weakSelf = self;
    [[RecommendRequest shareRecommendRequest] recommendRequestWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"dic = %@",dic);
        _array = dic[@"data"][@"hunters"][@"hunter_list"];
//        NSLog(@"array = %@",_array);
        for (NSDictionary *tempDic in dic[@"data"][@"hunters"][@"hunter_list"]) {
//            NSLog(@"tempDic = %@",tempDic);
            RecommendModel *model = [RecommendModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.dataArray addObject:model];
//            NSLog(@"dataArray = %@",weakSelf.dataArray);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.recommendTableView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}
-(void)requestMore
{
    __weak typeof(self) weakSelf = self;
    [[RecommendRequest shareRecommendRequest] recommendRequestMoreUrlWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"dic = %@",dic);
        _twoArray = dic[@"data"][@"product_list"];
//        NSLog(@"array = %@",_twoArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.recommendTableView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    [[RecommendRequest shareRecommendRequest] recommendRequestUrlWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"dic = %@",dic);
        _threeArray = dic[@"product_list"];
//        NSLog(@"array = %@",_threeArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.recommendTableView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
#pragma mark -- 视图显示的时候推出tableview
-(void)viewWillAppear:(BOOL)animated
{
    
    [self.view bringSubviewToFront:self.recommendTableView];
}

- (void)addAllViews
{
//----------------添加左右navigationItem--------------------
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"所有城市▶︎" style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分类▶︎" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightAction)];
    
    
#pragma mark ---- 头视图加searchBar和轮播图
    RecommendView *recommendV = [[RecommendView alloc] initWithFrame:CGRectMake(0, 0, WindownWidth, 194)];
    self.recommendTableView.tableHeaderView = recommendV;
    [recommendV.searchBtn addTarget:self action:@selector(searchButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [recommendV.addressBtn addTarget:self action:@selector(addressButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    recommendV.imageViewDelegate = self;
}
#pragma mark -- searchBtn的点击方法
- (void)searchButtonAction:(UIButton *)button
{
    RecommendSearchViewController *searchVC = [RecommendSearchViewController new];
    [self.navigationController pushViewController:searchVC animated:YES];
}
- (void)addressButtonAction:(UIButton *)btn
{
    
}
#pragma mark -- 点击 所有城市 触发的方法
- (void)leftAction
{
    CityViewController *cityVC = [CityViewController new];
    [self presentViewController:cityVC animated:NO completion:^{
        
        
    }];
    
    
}
#pragma mark -- 点击 分类 触发的方法
- (void)rightAction
{
    if (!_isOK) {
        self.classifyView.frame = CGRectMake(0, WindowHeight * 0.25, WindownWidth, WindowHeight * 0.75);
        self.classifyView.backgroundColor = [UIColor whiteColor];
        [self.view bringSubviewToFront:self.classifyView];
        _isOK = YES;
    }else{
        [self.view bringSubviewToFront:self.recommendTableView];
        _isOK = NO;
    }
    
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 185;
    }else if (indexPath.row == 1){
        return WindowHeight * 0.3;
    }else if (indexPath.row == 2){
        return WindowHeight * 0.3;
    }else{
        return WindowHeight * 0.3;
    }
//    return 185;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#warning -------------
    
    if (indexPath.row == 0) {
//        NSLog(@"0000");
        RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        RecommendModel *model = self.dataArray[indexPath.row];
        cell.model = model;
        cell.firstDelegate = self;
        cell.dataArr = _array;
        return cell;
        
    }else if (indexPath.row == 1){
        
        RecommendSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        cell.secondDelegate = self;
        cell.secondArr = _twoArray;
        return cell;
        
    }else if (indexPath.row == 2){
//        NSLog(@"22222");
        ThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"third" forIndexPath:indexPath];
        cell.thirdDelegate = self;
        cell.thirdArr = _threeArray;
//        NSLog(@"%@",cell.thirdArr);
        return cell;
        
    }else {
        FouthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fouth" forIndexPath:indexPath];
        return cell;
    }
    
}
#pragma mark -- 点击scrollView跳转页面
-(void)changePage{
    CityViewController *cityVC = [CityViewController new];
    [self.navigationController pushViewController:cityVC animated:YES];
}
- (void)firstChangePage
{
    CityViewController *cityVC = [CityViewController new];
    [self.navigationController pushViewController:cityVC animated:YES];
}
- (void)secondChangePage
{
    CityViewController *cityVC = [CityViewController new];
    [self.navigationController pushViewController:cityVC animated:YES];
}
- (void)thirdChangePage
{
    CityViewController *cityVC = [CityViewController new];
    [self.navigationController pushViewController:cityVC animated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 2) {
        CityViewController *cityVC = [CityViewController new];
        [self.navigationController pushViewController:cityVC animated:YES];
    }else{
        NSLog(@"buhaoba");
    }
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
