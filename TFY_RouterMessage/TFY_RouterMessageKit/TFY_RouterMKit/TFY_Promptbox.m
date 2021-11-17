//
//  TFY_Promptbox.m
//  TFY_RouterMessage
//
//  Created by 田风有 on 2021/11/17.
//  Copyright © 2021 田风有. All rights reserved.
//

#import "TFY_Promptbox.h"

#define kFontSize(fontSize) fontSize * (kScreenWidth / 375)
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

CGFloat padding = 10.f;
CGFloat textPadding = 15.f;

@interface TFY_Promptbox ()<CAAnimationDelegate>
/** mainView */
@property (nonatomic, strong) UIView *mainView;
/** label */
@property (nonatomic, strong) UILabel *label;
/** config */
@property (nonatomic, strong) TFY_PromptboxConfig *config;

/** notify */
@property (nonatomic, copy) NSString *notify;
/** showView */
@property (nonatomic, strong) UIView *showView;
@end

@implementation TFY_Promptbox

+ (TFY_Promptbox *)showNotify:(NSString *)notify {
    return [self showNotify:notify showView:[UIApplication sharedApplication].keyWindow];
}

+ (TFY_Promptbox *)showNotify:(NSString *)notify showView:(UIView *)showView {
    return [self showNotify:notify showView:showView config:[TFY_PromptboxConfig defaultNotifyConfig]];
}

+ (TFY_Promptbox *)showNotify:(NSString *)notify showView:(UIView *)showView config:(TFY_PromptboxConfig *)config {
    if (!config) {
        config = [TFY_PromptboxConfig defaultNotifyConfig];
    }
    if (!showView) {
        showView = [UIApplication sharedApplication].keyWindow;
    }
    return [[self alloc] initWithNotify:notify showView:showView config:config];
}

- (TFY_Promptbox *)initWithNotify:(NSString *)notify showView:(UIView *)showView config:(TFY_PromptboxConfig *)config{
    if (self = [super init]) {
        self.notify = notify;
        self.config = config;
        self.showView = showView;
        
        //初始化UI
        [self initNotifyUI];

        //初始化动画
        [self initNotifyAnimation];
    }
    return self;
}

#pragma mark - 初始化动画
- (void)initNotifyAnimation {
    CGPoint fromPoint = self.mainView.center;
    fromPoint.y = -self.mainView.frame.size.height;
    CGPoint oldPoint = self.mainView.center;
    
    
    if (@available(iOS 9.0, *)) {
        CFTimeInterval settlingDuratoin = 0.f;
        
        if (self.config.notifyStyle == TFY_StyleFill) {
            CABasicAnimation *fillAnim = [CABasicAnimation animationWithKeyPath:@"position"];
            fillAnim.fromValue = [NSValue valueWithCGPoint:fromPoint];
            fillAnim.toValue = [NSValue valueWithCGPoint:oldPoint];
            fillAnim.removedOnCompletion = NO;
            fillAnim.fillMode = kCAFillModeForwards;
            fillAnim.duration = 0.5;
            [self.mainView.layer addAnimation:fillAnim forKey:nil];
            
            settlingDuratoin = 0.5;
        } else if (self.config.notifyStyle == TFY_StyleFit) {
            CASpringAnimation *springAnim = [CASpringAnimation animationWithKeyPath:@"position"];
            springAnim.fromValue = [NSValue valueWithCGPoint:fromPoint];
            springAnim.toValue = [NSValue valueWithCGPoint:oldPoint];
            springAnim.removedOnCompletion = NO;
            springAnim.fillMode = kCAFillModeForwards;
            springAnim.stiffness = 60;
            springAnim.duration = springAnim.settlingDuration;
            [self.mainView.layer addAnimation:springAnim forKey:nil];
            
            settlingDuratoin = springAnim.settlingDuration;
        }
        
        CABasicAnimation *basicAnim = [CABasicAnimation animationWithKeyPath:@"position"];
        basicAnim.duration = 0.25;
        basicAnim.beginTime = CACurrentMediaTime() + settlingDuratoin+ self.config.notifyViewWaitDuration;

        basicAnim.fromValue = [NSValue valueWithCGPoint:oldPoint];
        basicAnim.toValue = [NSValue valueWithCGPoint:fromPoint];
        basicAnim.removedOnCompletion = NO;
        basicAnim.fillMode = kCAFillModeForwards;
        basicAnim.delegate = self;
        [self.mainView.layer addAnimation:basicAnim forKey:nil];

    }
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self removeNoiifyViewFromSuperview];
}

#pragma mark - 删除视图
- (void)removeNoiifyViewFromSuperview {
    [self removeFromSuperview];
}

#pragma mark - 初始化UI
- (void)initNotifyUI {
    [self.showView addSubview:self];
    
    padding = 10.f;
    if (self.config.notifyStyle == TFY_StyleFill) {
        padding = 0.f;
    }
    CGFloat mainViewX = padding;
    CGFloat mainViewW = kScreenWidth - mainViewX * 2;
    CGFloat mainViewY = padding;
    CGFloat mainViewH = 0;

    self.mainView = [[UIView alloc] initWithFrame:CGRectMake(mainViewX, mainViewY, mainViewW, mainViewH)];
    self.mainView.backgroundColor = self.config.backgroundColor;
    if (self.config.notifyStyle == TFY_StyleFit) {
        self.mainView.layer.cornerRadius = 6.f;
        self.mainView.layer.masksToBounds = YES;
    }
    [self addSubview:self.mainView];
    
    
    
    UIFont *titleFont = [UIFont systemFontOfSize:self.config.textSize];
    if (@available(iOS 8.2, *)) {
        titleFont = [UIFont systemFontOfSize:self.config.textSize weight:UIFontWeightMedium];
    }
    CGFloat titleLW = self.mainView.frame.size.width - textPadding * 2;
    CGFloat titleLH = [self getHeightForString:self.notify font:titleFont andWidth:titleLW];
    CGFloat titleLY = [self getStatusHeight] + 10;
    if (self.config.notifyStyle == TFY_StyleFill) {
        titleLY = textPadding;
        if (self.showView == [UIApplication sharedApplication].keyWindow) {
            titleLY = [self getStatusHeight] + textPadding;

        }
    }
    CGFloat titleLX = mainViewW * 0.5 - titleLW * 0.5;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(titleLX, titleLY, titleLW, titleLH)];
    NSMutableParagraphStyle *ps = [[NSMutableParagraphStyle alloc] init];
    ps.lineSpacing = self.config.textLineSpace;
    self.label.attributedText = [[NSAttributedString alloc] initWithString:self.notify attributes:@{
                                                                                                    NSFontAttributeName: titleFont,
                                                                                                    NSParagraphStyleAttributeName: ps,
                                                                                                    }];
    self.label.textColor = self.config.textColor;
    self.label.font = titleFont;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.numberOfLines = 0;
    [self.mainView addSubview:self.label];
    
    CGRect mainViewFrame = self.mainView.frame;
    mainViewFrame.size.height = CGRectGetMaxY(self.label.frame) + textPadding;
    self.mainView.frame = mainViewFrame;
}

#pragma mark - 判断是否有刘海
- (BOOL)isIphoneX {
    if (@available(iOS 11.0, *)) {
        if ([UIApplication sharedApplication].windows[0].safeAreaInsets.top > 0) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

#pragma mark - 获取状态栏高度
- (CGFloat)getStatusHeight {
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

#pragma mark - 根据宽度计算高度
- (CGFloat)getHeightForString:(NSString *)value font:(UIFont *)font andWidth:(CGFloat)width {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = self.config.textLineSpace;
    CGRect rect = [value boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{
                                               NSFontAttributeName: font,
                                               NSParagraphStyleAttributeName: paragraphStyle,
                                               }
                                     context:nil];
    return rect.size.height;
}


@end


@implementation UIColor (Promptboxcolor)

+(UIColor *)colorWithHexString:(NSString *)hexColor {
    return [self colorWithHexString:hexColor alpha:0.8];
}

+(UIColor *)colorWithHexString:(NSString *)hexColor alpha:(float)opacity{
    NSString * cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) return [UIColor blackColor];
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString * rString = [cString substringWithRange:range];
    range.location = 2;
    NSString * gString = [cString substringWithRange:range];
    range.location = 4;
    NSString * bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:opacity];
}

@end



@implementation TFY_PromptboxConfig

+ (TFY_PromptboxConfig *)defaultNotifyConfig {
    return [[self alloc] init];
}

- (instancetype)init {
    if (self = [super init]) {
        //初始化配置
        [self initNotifyConfig];
    }
    return self;
}

#pragma mark - 初始化配置
- (void)initNotifyConfig {
    self.notifyStyle = TFY_StyleFill;
    
    self.backgroundColor = [UIColor colorWithHexString:@"#000000"];
    self.textColor = [UIColor colorWithHexString:@"#ffffff"];
    
    self.textSize = kFontSize(16.f);
    self.textLineSpace = 2.f;
    
    self.textColor = UIColor.whiteColor;
    
    self.notifyViewWaitDuration = 1.5f;
}



@end
