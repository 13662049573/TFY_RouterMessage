//
//  TFY_Promptbox.h
//  TFY_RouterMessage
//
//  Created by 田风有 on 2021/11/17.
//  Copyright © 2021 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 通知框出现的样式, */
typedef NS_ENUM(NSInteger, TFY_Style) {
    TFY_StyleFit, //默认样式 (上 左 右 有间距)
    TFY_StyleFill, //填满样式 (上 左 右 无间距)
};

@class TFY_PromptboxConfig;

NS_ASSUME_NONNULL_BEGIN

@interface TFY_Promptbox : UIView

/**
 显示通知
 @param notify 通知文字
 */
+ (TFY_Promptbox *)showNotify:(NSString *)notify;

+ (TFY_Promptbox *)showNotify:(NSString *)notify showView:(UIView *)showView;

+ (TFY_Promptbox *)showNotify:(NSString *)notify showView:(UIView *)showView config:(TFY_PromptboxConfig *)config;

@end

@interface TFY_PromptboxConfig : NSObject

/************************** 默认初始化方法 **************************/
+ (TFY_PromptboxConfig *)defaultNotifyConfig;

/**************************  通知样式 **************************/
/** 通知样式 */
@property (nonatomic, assign) TFY_Style notifyStyle;

/** 通知视图的背景颜色(如果 backgroundType 不适用, 可通过此字段进行自定义) */
@property (nonatomic, strong) UIColor *backgroundColor;

/**************************  字体文字设置 **************************/
/** 文字字体大小 (默认 16) */
@property (nonatomic, assign) CGFloat textSize;
/** 文字字体颜色 (默认 black) */
@property (nonatomic, strong) UIColor *textColor;
/** 文字的行间距 (默认 2.f) */
@property (nonatomic, assign) CGFloat textLineSpace;

/**************************  动画设置 **************************/
/** 通知视图悬停时间 (默认 1.5) */
@property (nonatomic, assign) CGFloat notifyViewWaitDuration;


@end

NS_ASSUME_NONNULL_END
