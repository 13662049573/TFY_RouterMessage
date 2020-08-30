//
//  TFY_TabBarRouter.m
//  TFY_RouterMessage
//
//  Created by 田风有 on 2020/8/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_TabBarRouter.h"
#import "TFY_TabBarController.h"
@implementation TFY_TabBarRouter
+(void)load {
    [[TFY_RouterM router] tfy_registerScheme:@"tabbar" classPrefix:@"TFY_" actionPreFix:@"tfy_router"];
    /** 添加映射的类 */
    [[TFY_RouterM router] tfy_registerQuickName:@"tabbar" forClass:@"TabBarRouter" atScheme:@"tabbar"];
    /** 添加映射方法 - 基本使用 */
    [[TFY_RouterM router] tfy_registerQuickName:@"tabbar.index" forAction:@"showtabbarIndexPages" atScheme:@"tabbar"];
}

- (UIViewController *)tfy_router_showtabbarIndexPages:(NSDictionary *)params {
    TFY_TabBarController *tabbarVC = [TFY_TabBarController new];
    return tabbarVC;
}
@end
