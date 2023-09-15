//
//  BaseViewController.m
//  Thermometer
//
//  Created by tiandengyou on 2019/10/17.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self viewTemplate];
    [self configConstraint];
}
- (void)viewTemplate{}
- (void)configConstraint{}
/*不传数据，直接push到下一个界面*/
- (void)pushOpenUrl:(NSString*)openUrl parameWithDict:(NSDictionary *)parameters Finishblock:(FinishCompletionBlock)block {
    [[TFY_RouterM router] tfy_openUrl:openUrl parameters:parameters completion:^(id  _Nullable completionObject) {
        if ([completionObject isKindOfClass:UIViewController.class]) {
            UIViewController *vc = completionObject;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:false];
        }
    } finish:^(id  _Nullable finishObject) {
        block(finishObject);
    }];
}

- (void)presentingOpenUrl:(NSString*)openUrl parameWithDict:(NSDictionary *)parameters Finishblock:(FinishCompletionBlock)block {
    [[TFY_RouterM router] tfy_openUrl:openUrl parameters:parameters completion:^(id  _Nullable completionObject) {
        if ([completionObject isKindOfClass:UIViewController.class]) {
            TFY_NavigationController *nav = [[TFY_NavigationController alloc] initWithRootViewController:completionObject];
            nav.modalPresentationStyle = UIModalPresentationFullScreen;
            [self.navigationController presentViewController:nav animated:YES completion:nil];
        }
    } finish:^(id  _Nullable finishObject) {
        block(finishObject);
    }];
}


/*关闭界面，返回上一级*/
- (void)pop:(id)parame{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/*返回到固定界面*/
- (void)popToOpenUrl:(NSString*)openUrl parameWithDict:(NSDictionary *)parameters Finishblock:(FinishCompletionBlock)block {
    [[TFY_RouterM router] tfy_openUrl:openUrl parameters:parameters completion:^(id  _Nullable completionObject) {
        if ([completionObject isKindOfClass:UIViewController.class]) {
            NSArray *temArray = self.navigationController.viewControllers;
            for(UIViewController *temVC in temArray) {
                if ([temVC isKindOfClass:[completionObject class]]) {
                    [self.navigationController popToViewController:temVC animated:YES];
                }
            }
        }
    } finish:^(id  _Nullable finishObject) {
        block(finishObject);
    }];
}

/*返回到主界面*/
- (void)popToRoot:(id)parame{
    [self.navigationController popToRootViewControllerAnimated:true];
}

/**登录到主页*/
- (void)tabbarRoot:(id)parame {
    [[TFY_RouterM router] tfy_openUrl:@"tfy://tabbar/showtabbarIndexPages" parameters:parame completion:^(id  _Nullable completionObject) {
        if ([completionObject isKindOfClass:UIViewController.class]) {
            [UIApplication tfy_window].rootViewController = completionObject;
        }
    }];
}

//跳转url
- (NSString *)opnurl:(NSString *)classname {
    NSString *url = [NSString stringWithFormat:@"tfy://login/show%@IndexPages",classname];
    return url;
}

@end
