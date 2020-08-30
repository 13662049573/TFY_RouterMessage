//
//  TFY_TabBarController.m
//  TFY_RouterMessage
//
//  Created by 田风有 on 2020/8/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_TabBarController.h"

@interface TFY_TabBarController ()<TfySY_TabBarDelegate>
TFY_PROPERTY_ASSIGN NSInteger tabbar_index;
@end

@implementation TFY_TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabbar_index = 0;
    // 添加子VC
    [self addChildViewControllers];
}

- (void)addChildViewControllers{
    // 创建选项卡的数据 想怎么写看自己，这块我就写笨点了
    NSMutableArray *tabBarVCs = NSMutableArray.array;
    NSMutableArray *tabBarConfs = NSMutableArray.array;
    LTJ_ModuleModel *models = [LTJ_ModuleModel tfy_ModelobjectArrayWithFilename:@"Modules.json"];
    [models.links enumerateObjectsUsingBlock:^(LTJ_LinksModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TfySY_TabBarConfigModel *model = [TfySY_TabBarConfigModel new];
        if (obj.tabType!=2) {
            model.itemTitle = obj.tabName;
            model.selectImageName = obj.tabImg_select;
            model.normalImageName = obj.tabImg_default;
            model.selectColor = TFY_ColorHexString(obj.tabColor_select);
            model.normalColor = TFY_ColorHexString(obj.tabColor_default);
        }
        if (obj.tabType == 2 ) { // 如果是中间的
            self.tabbar_index = obj.tabType;
            model.bulgeStyle = TfySY_TabBarConfigBulgeStyleCircular;// 设置凸出 矩形
            model.bulgeHeight = 30;// 设置凸出高度
            model.itemLayoutStyle = TfySY_TabBarItemLayoutStyleTopPictureBottomTitle;// 设置成图片文字展示
            model.selectImageName = obj.tabImg_select;
            model.normalImageName = obj.tabImg_default;
            model.selectBackgroundColor = model.normalBackgroundColor = [UIColor clearColor];
            model.backgroundImageView.hidden = YES;
            model.componentMargin = UIEdgeInsetsMake(0,0,0,0);// 设置图片大小c上下左右全边距
            // 设置图片的高度为40
            model.icomImgViewSize = CGSizeMake(self.tabBar.frame.size.width / 5, 60);
            model.titleLabelSize = CGSizeMake(self.tabBar.frame.size.width / 5, 20);
            model.pictureWordsMargin = 0;// 图文间距0
            model.titleLabel.font = [UIFont systemFontOfSize:11];// 设置标题文字字号
            model.itemSize = CGSizeMake(self.tabBar.frame.size.width / 5 - 5.0 ,self.tabBar.frame.size.height + 20);// 设置大小/边长 自动根据最大值进行裁切
        }else{
            // 来点效果好看 // 其他的按钮来点小动画吧
            model.interactionEffectStyle = TfySY_TabBarInteractionEffectStyleShake;
            // 点击背景稍微明显点吧
            model.selectBackgroundColor = TfySY_TabBarRGBA(248, 248, 248, 1);
            model.normalBackgroundColor = [UIColor clearColor];
        }
        __block UIViewController *controller;
        [[TFY_RouterM router] tfy_openUrl:obj.url parameters:@{@"id":@"9527"} completion:^(id  _Nullable completionObject) {
            controller = completionObject;
            controller.hidesBottomBarWhenPushed = NO;
            controller.view.backgroundColor = [UIColor tfy_randomColor];
            controller.title = obj.title_name;
        }];
        TFY_NavigationController *nav = [[TFY_NavigationController alloc] initWithRootViewController:controller];
        // 5.将VC添加到系统控制组
        [tabBarVCs addObject:nav];
        // 5.1添加构造Model到集合
        [tabBarConfs addObject:model];
    }];
    
    // 使用自定义的TabBar来帮助触发凸起按钮点击事件
    TfySY_TestTabBar *testTabBar = [TfySY_TestTabBar new];
    [self setValue:testTabBar forKey:@"tabBar"];
    
    self.ControllerArray = tabBarVCs;
    self.tfySY_TabBar = [[TfySY_TabBar alloc] initWithTabBarConfig:tabBarConfs];
    self.tfySY_TabBar.delegate = self;
    self.tfySY_TabBar.backgroundColor = [UIColor whiteColor];
    // 8.添加覆盖到上边
    [self.tabBar addSubview:self.tfySY_TabBar];
}
// 9.实现代理，如下：
static NSInteger lastIdx = 0;
- (void)TfySY_TabBar:(TfySY_TabBar *)tabbar selectIndex:(NSInteger)index{
    if (index != 2) {
        [self setSelectedIndex:index];// 通知 切换视图控制器
        lastIdx = index;
    }else{
        if (self.tabbar_index==2) {// 点击了中间的
            TFY_AlertControllerAlertCreate(@"提示", @"点击了中间的,不切换视图")
            .tfy_addCancelAction(@"取消", 1).tfy_addDefaultAction(@"确定", 2)
            .tfy_actionTap(^(NSInteger index, UIAlertAction * _Nonnull action) {
                NSLog(@"好的！！！！");
            }).tfy_showFromViewController(self);
        }
        else {
            [self setSelectedIndex:index];
            lastIdx = index;
        }
        [self.tfySY_TabBar setSelectIndex:lastIdx WithAnimation:NO]; // 换回上一个选中状态
    }
}


@end
