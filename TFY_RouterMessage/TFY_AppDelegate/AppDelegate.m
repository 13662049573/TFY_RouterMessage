//
//  AppDelegate.m
//  TFY_RouterMessage
//
//  Created by 田风有 on 2020/8/27.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (!TFY_ScenePackage.isSceneApp) {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
    }
    [TFY_ScenePackage addBeforeWindowEvent:^(TFY_Scene * _Nonnull application) {
        [[TFY_RouterM router] tfy_openUrl:@"tabbar://tabbar/showtabbarIndexPages" parameters:@{} completion:^(id  _Nullable completionObject) {
            if ([completionObject isKindOfClass:UIViewController.class]) {
                [UIApplication tfy_window].rootViewController = completionObject;
            }
        }];
    }];
    return YES;
}




@end
