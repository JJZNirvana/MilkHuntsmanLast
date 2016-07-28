//
//  ThirdTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "ThirdTableViewCell.h"

@implementation ThirdTableViewCell


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
    _thirdArr = [NSMutableArray array];
    self.scrollView = [UIScrollView new];
    [self.contentView addSubview:self.scrollView];
    
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
        self.litileImageView = [UIImageView new];
        self.litileImageView.frame = CGRectMake(5, 5, 40, 40);
        self.bigImageView.frame = CGRectMake(0, CGRectGetMaxY(self.litileImageView.frame) + 5, kWidth - 5, kHeight - 120);
        [self.tempView addSubview:self.bigImageView];
        [self.tempView addSubview:self.litileImageView];
        
        self.bigImageView.backgroundColor = [UIColor redColor];
        self.litileImageView.backgroundColor = [UIColor greenColor];
        self.litileImageView.layer.cornerRadius = self.litileImageView.bounds.size.width / 2;
        self.litileImageView.layer.masksToBounds = YES;
        //------------------在tempView上添加label---------------
        self.nameLabel = [UILabel new];
        self.descriptionLabel = [UILabel new];
        self.addressLabel = [UILabel new];
        self.activityLabel = [UILabel new];
        self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.litileImageView.frame), CGRectGetMidY(self.litileImageView.frame) - 15, 70, 30);
        self.descriptionLabel.frame = CGRectMake(10, CGRectGetMaxY(self.bigImageView.frame), kWidth - 20, 30);
        self.descriptionLabel.numberOfLines = 0;
        self.addressLabel.frame = CGRectMake(kWidth - 100, 10, 90, 30);
        self.activityLabel.frame = CGRectMake(10, CGRectGetMaxY(self.descriptionLabel.frame), kWidth - 10, 35);
        self.activityLabel.backgroundColor = [UIColor purpleColor];
        self.addressLabel.backgroundColor = [UIColor magentaColor];
        self.nameLabel.backgroundColor = [UIColor yellowColor];
        self.descriptionLabel.backgroundColor = [UIColor cyanColor];
        [self.tempView addSubview:self.nameLabel];
        [self.tempView addSubview:self.descriptionLabel];
        [self.tempView addSubview:self.addressLabel];
        [self.tempView addSubview:self.activityLabel];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
        self.descriptionLabel.font = [UIFont systemFontOfSize:15.0];
        self.descriptionLabel.numberOfLines = 0;
        
//-----------------------赋值--------------------------
//        [self.litileImageView setImageWithURL:[NSURL URLWithString:_thirdArr[i][@"user"][@"avatar_l"]]];
//        [self.bigImageView setImageWithURL:[NSURL URLWithString:_thirdArr[i][@"title_page"]]];
//        self.nameLabel.text = [NSString stringWithFormat:@"%@",_thirdArr[i][@"user"][@"name"]];
        NSLog(@"arr = %@",_thirdArr);
//-----------------------每个tempView添加一个手势-----------------------
        self.tempView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self.tempView  addGestureRecognizer:tapGesture];
        
        
        
    }
    
    
    
}
- (void)tapAction:(UITapGestureRecognizer *)sender
{
    [self.thirdDelegate thirdChangePage];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
