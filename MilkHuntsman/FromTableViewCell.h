//
//  FromTableViewCell.h
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/23.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FromTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
-(CGFloat)getHeight:(NSString *)text
               font:(CGFloat)font;
@end
