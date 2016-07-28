//
//  AppDelegate.m
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "AppDelegate.h"
#import <SMS_SDK/SMSSDK.h>

#import "EMSDK.h"
#import <Wilddog/Wilddog.h>
#import "WeiboSDK.h"
@interface AppDelegate ()<WeiboSDKDelegate>
@property (nonatomic, strong) Wilddog *ref;

//#import <UMSocialWechatHandler.h>
//#import <UMSocialQQHandler.h>
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //初始化应用，appKey和appSecret从后台申请得
    self.hasLogined=NO;
    [SMSSDK registerApp:@"1419a01addae0" withSecret:@"56022de00d8ebbc52cda43f5994739f9"];
    
    //环信
    //AppKey:注册的AppKey，详细见下面注释。
    //apnsCertName:推送证书名（不需要加后缀），详细见下面注释。
    EMOptions *options = [EMOptions optionsWithAppkey:@"lanou3glanou3g#0309huanxin"];
    options.apnsCertName = @"0309DevPush";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    //第三方登录
    //    if ([self wilddogIsSetup]) {
    //        self.ref = [[Wilddog alloc] initWithUrl:kWilddogURL];
    //    }
    
    
    [WeiboSDK registerApp:@"1583257867"];
    [WeiboSDK enableDebugMode:YES];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //        if ([url.absoluteString hasPrefix:@"wx"]) {
    //            return [WXApi handleOpenURL:url delegate:self];
    /*}else*/ if ([url.absoluteString hasPrefix:@"wb"]) {
        return [WeiboSDK handleOpenURL:url delegate:self ];
        //        }else if ([url.absoluteString hasPrefix:@"tencent"]) {
        //            return [TencentOAuth HandleOpenURL:url];
    }
    return NO;
}
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        WBAuthorizeResponse *wbResponse = (WBAuthorizeResponse *)response;
        if (wbResponse.accessToken == nil || wbResponse.userID == nil) {
            return;
        }
        
        [self.ref authWithOAuthProvider:@"weibo" parameters:@{@"access_token":wbResponse.accessToken,@"userID":wbResponse.userID} withCompletionBlock:^(NSError *error, WAuthData *authData) {
            
        }];
    }
}
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request{
    
}

- (void)authWithOAuthProvider:(NSString *)provider parameters:(NSDictionary *)parameters withCompletionBlock:(void ( ^ ) ( NSError *error , WAuthData *authData ))block{
    
    
}
//////////////////////////////////////////////////////
// APP进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}

// APP将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[EMClient sharedClient] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
