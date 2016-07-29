//
//  WebViewController.m
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "WebViewController.h"
#import "NetWorkRequest.h"


@interface WebViewController1 ()

@property (nonatomic, strong) UIWebView *findDetailWebView;

//收藏列表属性
@property (nonatomic, strong) WebViewController1 *collectVC;
//又写了收藏按钮改值
@property (nonatomic, strong) UIBarButtonItem *collectItem;

@end

@implementation WebViewController1

//加载一个view挡住网页版的标题
- (void)viewWillAppear:(BOOL)animated{
    [GiFHUD show];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    
    [milk hiddenTabBar];

    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 25)];
    view1.backgroundColor = [UIColor colorWithRed:0.29 green:0.74 blue:0.80 alpha:1.00];
    [self.view addSubview:view1];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addAllViews];
    
    [self loadWebView];
    
    [self addItem];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.29 green:0.74 blue:0.80 alpha:1.000]];
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [GiFHUD dismiss];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    
    [milk showTabBar];
}
- (void)addItem{
    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightItemCollertAction:)];
    self.collectItem = rightItem1;
    
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightItemShareAction:)];
    self.navigationItem.rightBarButtonItems = @[rightItem1,rightItem2];
 
    
    
}


//收藏按钮方法
- (void)rightItemCollertAction:(UIBarButtonItem *)sender{



}


//分享按钮方法
- (void)rightItemShareAction:(UIBarButtonItem *)sender{



}



//初始化webView
- (void)addAllViews{
    
    self.findDetailWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 25, WindownWidth, WindowHeight - 25)];
    [self.view addSubview:self.findDetailWebView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction:)];
    
}

- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

//加载网址
- (void)loadWebView{

  //缓存策略 超时限制
     NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",FindDetailRequest_Url(_passID)]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [self.findDetailWebView loadRequest:request];
 
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
