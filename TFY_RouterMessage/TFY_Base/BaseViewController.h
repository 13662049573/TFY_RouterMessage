//
//  BaseViewController.h
//  Thermometer
//
//  Created by tiandengyou on 2019/10/17.
//  Copyright © 2019 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^FinishCompletionBlock)(id _Nullable finishObject);

@interface BaseViewController : UIViewController<TFY_RouterMFinishCompletionProtocol>
/*不传数据，直接push到下一个界面*/
- (void)pushOpenUrl:(NSString*)openUrl parameWithDict:(NSDictionary *)parameters Finishblock:(FinishCompletionBlock)block;

/**弹出界面*/
- (void)presentingOpenUrl:(NSString*)openUrl parameWithDict:(NSDictionary *)parameters Finishblock:(FinishCompletionBlock)block;
/*关闭界面，返回上一级*/
- (void)pop:(id)parame;
/*返回到固定界面*/
- (void)popToOpenUrl:(NSString*)openUrl parameWithDict:(NSDictionary *)parameters Finishblock:(FinishCompletionBlock)block;
/*返回到主界面*/
- (void)popToRoot:(id)parame;
/**登录到主页*/
- (void)tabbarRoot:(id)parame;
//跳转url
- (NSString *)opnurl:(NSString *)classname;

#pragma mark - View Template -- 视图层级关系绘制
- (void)viewTemplate;
#pragma mark - Config Constraint -- 布局配置
- (void)configConstraint;

@end

NS_ASSUME_NONNULL_END
