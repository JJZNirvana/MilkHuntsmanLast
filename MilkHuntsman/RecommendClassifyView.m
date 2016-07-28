//
//  RecommendClassifyView.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendClassifyView.h"

@implementation RecommendClassifyView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    self.backgroundColor = [UIColor whiteColor];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(182, 15, 50, 50)];
    self.titleLabel.text = @"分类";
    [self addSubview:self.titleLabel];

    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, WindownWidth, 1)];
    self.lineView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.lineView];
    
    self.textScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 82, WindownWidth, WindowHeight * 0.5)];
    self.textScrollView.contentSize = CGSizeMake(0, WindowHeight);
    [self addSubview:self.textScrollView];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
