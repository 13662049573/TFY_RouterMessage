//
//  ViewController.m
//  TFY_RouterMessage
//
//  Created by 田风有 on 2020/8/27.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
TFY_PROPERTY_CHAIN NSString *msg;
TFY_PROPERTY_STRONG UILabel *title_label,*desc_label;
@end

@implementation ViewController

- (instancetype)initWithMsg:(NSString *)msg {
    self = [super init];
    if (self) {
        self.msg = msg;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"跳转成功";
    
    UILabelModelSet()
    .multiple(2)
    .text([self.msg length] ? self.msg : @"路由跳转成功")
    .font([UIFont systemFontOfSize:16 weight:UIFontWeightBold])
    .textAlignment(NSTextAlignmentCenter)
    .numberOfLines(0)
    .addToSuperView(self.view)
    .assignToObjects(^(NSArray * _Nonnull objs) {
        self.title_label = objs[0];
        self.desc_label = objs[1];
    })
    .part_sencond()
    .text(@"点击屏幕任意位置返回上一层").textAlignment(NSTextAlignmentCenter)
    .font([UIFont systemFontOfSize:16 weight:UIFontWeightBold])
    .addToSuperView(self.view);
    
    self.title_label.tfy_LeftSpace(0).tfy_RightSpace(0).tfy_HeightAuto().tfy_CenterY(0);
    
    self.desc_label.tfy_TopSpaceToView(20, self.title_label).tfy_SizeEqualView(self.title_label);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.navigationController) {
        if (self.navigationController.presentingViewController) {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    [self tfy_routerm_performFinishCompletionBlock:self.msg];
}

- (void)dealloc{
    NSLog(@"【%@】控制器已释放", NSStringFromClass(self.class));
    
}
@end
