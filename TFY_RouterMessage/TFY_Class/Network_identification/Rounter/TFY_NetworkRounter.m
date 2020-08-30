//
//  TFY_NetworkRounter.m
//  TFY_RouterMessage
//
//  Created by 田风有 on 2020/8/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_NetworkRounter.h"
#import "TFY_Network_identificationController.h"
#import "ViewController.h"
@implementation TFY_NetworkRounter

+(void)load {
    [[TFY_RouterM router] tfy_registerScheme:@"http" classPrefix:@"TFY_" actionPreFix:@"http_router_"];
    /** 路由映射协议 */
    [[TFY_RouterM router] tfy_remoteScheme:@"https" toTargetScheme:@"http"];
    //映射本类的使用方法
    [[TFY_RouterM router] tfy_registerQuickName:@"tfy.8531.cn" forClass:@"NetworkRounter" atScheme:@"http"];
    
    
    [[TFY_RouterM router] tfy_registerQuickName:@"news.html" forAction:@"shownetworkpagth" atScheme:@"http"];
    
    /** 添加映射方法 - 基本使用 */
    [[TFY_RouterM router] tfy_registerQuickName:@"live.html"
                                forAction:@"shownetworkSuccesspagth"
                                 atScheme:@"http"];
    
    
}

- (UIViewController *)http_router_shownetworkpagth:(NSDictionary *)pames {
    TFY_Network_identificationController *vc = [TFY_Network_identificationController new];
    return vc;
}

- (UIViewController *)http_router_shownetworkSuccesspagth:(NSDictionary *)pames {
    ViewController *vc = [[ViewController alloc] initWithMsg:[self getJSONString:pames]];
    return vc;
}

- (NSString *)getJSONString:(NSDictionary *)params {
    if ([params isKindOfClass:[NSDictionary class]]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:params
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
        return [[NSString alloc]initWithData:data
                                    encoding:NSUTF8StringEncoding];
    }else if ([params isKindOfClass:[NSString class]]) {
        return (NSString *)params;
    }
    return @"";
}
@end
