//
//  TFY_BasicRounter.m
//  TFY_RouterMessage
//
//  Created by 田风有 on 2020/8/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_BasicRounter.h"
#import "TFY_Basic_usageController.h"
#import "ViewController.h"
@implementation TFY_BasicRounter

+(void)load {
    [[TFY_RouterM router] tfy_registerScheme:@"tfy" classPrefix:nil actionPreFix:nil ignoredCase:YES];
    //映射本类的使用方法
    [[TFY_RouterM router] tfy_registerQuickName:@"basice.cn" forClass:@"TFY_BasicRounter" atScheme:@"tfy"];
    
    [[TFY_RouterM router] tfy_registerQuickName:@"index" forAction:@"tfy_router_showbasicepagth" atScheme:@"tfy"];
    /** 添加映射的类 */
    [[TFY_RouterM router] tfy_registerQuickName:@"success" forAction:@"showbasiceSuccesspagth" atScheme:@"tfy"];
    /** block 添加映射方法 */
    [[TFY_RouterM router] tfy_registerUrl:@"tfy://basice.cn/comment" handler:^id _Nonnull(NSString * _Nonnull url, NSDictionary * _Nullable parameters) {
        UIViewController *vc = [[ViewController alloc] initWithMsg:@"tfy://basice.cn/comment 成功"];
        return vc;
    }];
    
}

- (UIViewController *)tfy_router_showbasicepagth:(NSDictionary *)pames {
    TFY_Basic_usageController *vc = [TFY_Basic_usageController new];
    return vc;
}

- (UIViewController *)showbasiceSuccesspagth:(NSDictionary *)pames {
    NSString *url = [NSString stringWithFormat:@"%@",pames[@"url"]];
    ViewController *vc = [[ViewController alloc] initWithMsg:url];
    return vc;
}
@end
