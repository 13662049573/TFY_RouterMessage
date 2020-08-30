//
//  TFY_RouterDelegate.m
//  TFY_RouterMessage
//
//  Created by 田风有 on 2020/8/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_RouterDelegate.h"

@implementation TFY_RouterDelegate
#pragma mark - Life Circle -- 生命周期和初始化设置

+ (void)load {
    [TFY_RouterM router].delegate = [self new];
}


- (void)tfy_router:(nonnull TFY_RouterM *)router beginHandlerUrl:(nonnull NSString *)url parameters:(nonnull NSDictionary *)parameters {
    NSLog(@"print:beginHandlerUrl-%@",url);
}

- (void)tfy_router:(nonnull TFY_RouterM *)router endHandlerParameters:(nonnull NSMutableDictionary *)realParameters forUrl:(nonnull NSString *)url {
    NSLog(@"print:endHandlerParameters-%@",url);
}

- (BOOL)tfy_router:(nonnull TFY_RouterM *)router willHandlerUrl:(nonnull NSString *)url parameters:(nonnull NSDictionary *)parameters {
    NSLog(@"print:willHandlerUrl-%@",url);
    return YES;
}

- (void)tfy_router:(nonnull TFY_RouterM *)router didHandlerUrl:(nonnull NSString *)url parameters:(nonnull NSDictionary *)parameters {
    NSLog(@"print:didHandlerUrl-%@",url);
}

- (BOOL)tfy_router:(nonnull TFY_RouterM *)router willRunCompletion:(nonnull id)completionObject hasHandlerUrl:(nonnull NSString *)url parameters:(nonnull NSDictionary *)parameters {
    NSLog(@"print:willRunCompletion-%@",url);
    return YES;
}

- (BOOL)tfy_router:(nonnull TFY_RouterM *)router willAddFinishToUrl:(nonnull NSString *)url parameters:(nonnull NSDictionary *)parameters forObject:(nonnull id)completionObject {
    NSLog(@"print:willAddFinishToUrl-%@",url);
    return YES;
}

- (void)tfy_router:(nonnull TFY_RouterM *)router failHandlerUrl:(nonnull NSString *)url parameters:(nonnull NSDictionary *)parameters error:(nonnull NSError *)error {
    NSLog(@"print:failHandlerUrl-%@",url);
}

- (BOOL)tfy_router:(nonnull TFY_RouterM *)router redirectUrl:(nonnull NSString *)sourceUrl toUrl:(nonnull NSString *)toUrl parameters:(nonnull NSDictionary *)parameters {
    NSLog(@"print:redirectUrl-%@",sourceUrl);
    return YES;
}

- (BOOL)tfy_router:(nonnull TFY_RouterM *)router willHandlerStarUrl:(nonnull NSString *)url parameters:(nonnull NSDictionary *)parameters selector:(inout NSString *__autoreleasing)selectorPoint {
    NSLog(@"print:willHandlerStarUrl-%@",url);
    return YES;
}


@end
