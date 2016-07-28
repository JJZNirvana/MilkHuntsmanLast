//
//  enter.h
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/19.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface enter : NSObject
- (void)loginRequestWithUsername:(NSString *)username
                        password:(NSString *)password
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure;
@end
