//
//  loginViewController.h
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseViewController.h"

@protocol dismiss <NSObject>

-(void)dismiss;

@end

@interface loginViewController : BaseViewController
@property(nonatomic,strong)id<dismiss>delegate;
@end
