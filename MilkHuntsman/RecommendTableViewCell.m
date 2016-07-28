//
//  RecommendTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendTableViewCell.h"
#import "RecommendRequest.h"
@implementation RecommendTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllViews];
    }
    return self;
}
- (void)addAllViews
{
//    self.urlArray = [NSMutableArray array];
//    [self.urlArray addObject:_model.avatar_l];
    self.recommendScrollView = [UIScrollView new];
    [self.contentView addSubview:self.recommendScrollView];

    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//--------------------添加scrollView---------------
    NSInteger kWidth = WindownWidth * 0.4;
    NSInteger kHeight = WindowHeight * 0.25;
    self.recommendScrollView.frame = CGRectMake(0, 0, WindownWidth, WindowHeight * 0.25);
    self.recommendScrollView.contentSize = CGSizeMake(kWidth * 6 + 5, 0);
    for (int i = 0; i < 6; i ++) {
        self.tempView = [[UIView alloc] initWithFrame:CGRectMake(kWidth * i + 5, 5, kWidth - 5, kHeight)];
        self.tempView.layer.cornerRadius = 10;
        self.tempView.layer.masksToBounds = YES;
        self.tempView.backgroundColor = [UIColor grayColor];
        [self.recommendScrollView addSubview:self.tempView];
        
//-------------------在tempView上添加imageView-------------
        self.recommendImageView = [UIImageView new];
        self.recommendImageView.frame = CGRectMake(0, 0, kWidth - 5, kHeight - 80);
//        [self.recommendImageView setImageWithURL:[NSURL URLWithString:self.model.avatar_l]];
        [self.recommendImageView setImageWithURL:[NSURL URLWithString:_dataArr[i][@"avatar_l"]]];
        self.recommendImageView.layer.cornerRadius = 5;
        self.recommendImageView.layer.masksToBounds = YES;
        self.recommendImageView.backgroundColor = [UIColor redColor];
        [self.tempView addSubview:self.recommendImageView];
        
        
//------------------在tempView上添加两个label---------------
        self.recommendDescriptionLabel = [UILabel new];
        self.recommendMoneyLabel = [UILabel new];
        self.recommendDescriptionLabel.frame = CGRectMake(0, CGRectGetMaxY(self.recommendImageView.frame), kWidth - 5, 50);
        self.recommendMoneyLabel.frame = CGRectMake(CGRectGetMidX(self.recommendDescriptionLabel.frame), CGRectGetMaxY(self.recommendDescriptionLabel.frame), kWidth / 2, 30);
        self.recommendDescriptionLabel.backgroundColor = [UIColor greenColor];
        self.recommendMoneyLabel.backgroundColor = [UIColor cyanColor];
        [self.tempView addSubview:self.recommendDescriptionLabel];
        [self.tempView addSubview:self.recommendMoneyLabel];
        
        
        
//        _recommendDescriptionLabel.text = [NSString stringWithFormat:@"%@",_model.product_title];
//        _recommendMoneyLabel.text = [NSString stringWithFormat:@"¥%@",_model.goodcomment_rate];
        _recommendDescriptionLabel.text = _dataArr[i][@"product_title"];
        _recommendMoneyLabel.text = [NSString stringWithFormat:@"¥%@",_dataArr[i][@"product_id"]];
        self.recommendMoneyLabel.textAlignment = NSTextAlignmentCenter;
        self.recommendDescriptionLabel.font = [UIFont systemFontOfSize:14.0];
        self.recommendDescriptionLabel.numberOfLines = 0;
        self.recommendMoneyLabel.textColor = [UIColor redColor];
        
//-----------------------每个tempView添加一个手势-----------------------
        self.tempView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self.tempView  addGestureRecognizer:tapGesture];
        
        
    }
    
}
//手势的触发方法
-(void)tapAction:(UITapGestureRecognizer *)sender
{
    
    [self.firstDelegate firstChangePage];
   
}
#pragma mark -- 赋值
-(void)setModel:(RecommendModel *)model
{
//    NSLog(@"model = %@",model);
    if (_model != model) {
        _model = nil;
        _model = model;
//        [_recommendImageView setImageWithURL:[NSURL URLWithString:model.avatar_l]];
//        _recommendDescriptionLabel.text = [NSString stringWithFormat:@"%@",model.product_title];
//        _recommendMoneyLabel.text = [NSString stringWithFormat:@"¥%@",model.goodcomment_rate];
//        NSLog(@"url = %@",model.avatar_l);
//        NSLog(@"%@",_model);
        
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
