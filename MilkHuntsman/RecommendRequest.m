//
//  RecommendRequest.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendRequest.h"
static RecommendRequest *request = nil;
@implementation RecommendRequest
+(instancetype)shareRecommendRequest{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[RecommendRequest alloc] init];
    });
    return request;
}
-(void)recommendRequestWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendRequestUrl parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}
#warning -----
-(void)recommendRequestMoreUrlWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendRequestUrl parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}
-(void)recommendRequestUrlWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendAddressUrl parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}
@end
