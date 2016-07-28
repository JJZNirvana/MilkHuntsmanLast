//
//  homePageTableViewCell.m
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/19.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "homePageTableViewCell.h"

@implementation homePageTableViewCell

- (void)awakeFromNib {
    
    self.bakgroundIV.layer.masksToBounds = YES;
    
    self.bakgroundIV.layer.cornerRadius = 10;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
