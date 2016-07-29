//
//  HYBModalTransition.h
//  HYBTransitionAnimations
//
//  Created by huangyibiao on 16/3/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBBaseTransition.h"

@interface HYBModalTransition : HYBBaseTransition

@property (nonatomic, assign) CGPoint scale;

@property (nonatomic, assign) CGFloat presentedHeight;

@property (nonatomic, assign) BOOL scapshotIncludingNavigationBar;


@property (nonatomic, assign) BOOL shouldDismissOnTap;


@end
