//
//  TFY_ProjectRounter.m
//  TFY_RouterMessage
//
//  Created by 田风有 on 2020/8/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_ProjectRounter.h"
#import "TFY_Project_usageController.h"
#import "ViewController.h"
@implementation TFY_ProjectRounter

+(void)load {
    /**注册路由*/
    [[TFY_RouterM router] tfy_registerScheme:@"project" classPrefix:@"TFY_" actionPreFix:@"tfy_router"];
    //映射本类的使用方法
    [[TFY_RouterM router] tfy_registerQuickName:@"project" forClass:@"ProjectRounter" atScheme:@"project"];
    
    [[TFY_RouterM router] tfy_registerQuickName:@"project.index" forAction:@"showprojectpagth" atScheme:@"project"];
    
    //project://project/showprojectpagth
    /** 添注册  *方法映射 支持类名和映射名 */
    [[TFY_RouterM router] tfy_registerQuickName:@"project/*" forAction:NSStringFromSelector(@selector(tfy_router_wildcard:params:)) atScheme:@"project"];
}

- (UIViewController *)tfy_router_showprojectpagth:(NSDictionary *)pames {
    TFY_Project_usageController *vc = [TFY_Project_usageController new];
    return vc;
}

- (UIViewController *)showbasiceSuccesspagth:(NSDictionary *)pames {
    NSString *url = [NSString stringWithFormat:@"%@",pames[@"url"]];
    ViewController *vc = [[ViewController alloc] initWithMsg:url];
    return vc;
}

- (UIViewController *)tfy_router_wildcard:(NSString *)urls params:(NSDictionary *)pames {
    NSString *url = [NSString stringWithFormat:@"调用[*]方法成功:-%@",pames[@"url"]];
    ViewController *vc = [[ViewController alloc] initWithMsg:url];
    return vc;
}
@end

