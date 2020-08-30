//
//  UIView+Controller.h
//  LX_Player
//
//  Created by 田风有 on 2020/7/21.
//  Copyright © 2020 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FinishCompletionBlock)(id _Nullable finishObject);

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Controller)<TFY_RouterMFinishCompletionProtocol>
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
@end

NS_ASSUME_NONNULL_END
