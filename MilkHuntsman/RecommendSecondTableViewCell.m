//
//  RecommendSecondTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendSecondTableViewCell.h"

@implementation RecommendSecondTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllViews];
    }
    return self;
}
- (void)addAllViews
{
    
    self.scrollView = [UIScrollView new];
    [self.contentView addSubview:self.scrollView];
    
//    self.bigImageView = [UIImageView new];
//    self.litleImageView = [UIImageView new];
    
    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //--------------------添加scrollView---------------
    NSInteger kWidth = WindownWidth * 0.8;
    NSInteger kHeight = WindowHeight * 0.3;
    self.scrollView.frame = CGRectMake(0, 0, WindownWidth, kHeight);
    self.scrollView.contentSize = CGSizeMake(kWidth * 6 + 5, 0);
    for (int i = 0; i < 6; i ++) {
        self.tempView = [[UIView alloc] initWithFrame:CGRectMake(kWidth * i + 5, 5, kWidth - 5, kHeight)];
        self.tempView.layer.cornerRadius = 10;
        self.tempView.layer.masksToBounds = YES;
        self.tempView.backgroundColor = [UIColor lightGrayColor];
        [self.scrollView addSubview:self.tempView];
        
//-------------------在tempView上添加imageView-------------
        self.bigImageView = [UIImageView new];
        self.bigImageView.frame = CGRectMake(0, 0, kWidth - 5, kHeight - 100);
        self.litleImageView = [UIImageView new];
        self.litleImageView.frame = CGRectMake(self.bigImageView.center.x - 20, CGRectGetMaxY(self.bigImageView.frame) - 20, 40, 40);
        [self.tempView addSubview:self.bigImageView];
        [self.tempView addSubview:self.litleImageView];
        
        self.bigImageView.backgroundColor = [UIColor redColor];
        self.litleImageView.backgroundColor = [UIColor greenColor];
        self.litleImageView.layer.cornerRadius = self.litleImageView.bounds.size.width / 2;
        self.litleImageView.layer.masksToBounds = YES;
//------------------在tempView上添加两个label---------------
        self.titleLabel = [UILabel new];
        self.descriptionLabel = [UILabel new];
        self.titleLabel.frame = CGRectMake(30, CGRectGetMaxY(self.litleImageView.frame), kWidth - 60, 35);
        self.descriptionLabel.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame), kWidth - 20, 35);
        self.descriptionLabel.numberOfLines = 0;
        self.titleLabel.backgroundColor = [UIColor yellowColor];
        self.descriptionLabel.backgroundColor = [UIColor cyanColor];
        [self.tempView addSubview:self.titleLabel];
        [self.tempView addSubview:self.descriptionLabel];
        
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
        self.descriptionLabel.font = [UIFont systemFontOfSize:15.0];
        self.descriptionLabel.numberOfLines = 0;
        
        
        
//-----------------------赋值------------------------
        [self.bigImageView setImageWithURL:[NSURL URLWithString:_secondArr[i][@"title_page"]]];
        [self.litleImageView setImageWithURL:[NSURL URLWithString:_secondArr[i][@"user"][@"avatar_l"]]];
        self.titleLabel.text = _secondArr[i][@"user"][@"name"];
        self.descriptionLabel.text = _secondArr[i][@"title"];
//-----------------------每个tempView添加一个手势-----------------------
        self.tempView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self.tempView  addGestureRecognizer:tapGesture];
        
        
        
    }

    
    
}

- (void)tapAction:(UITapGestureRecognizer *)sender
{
    [self.secondDelegate secondChangePage];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
