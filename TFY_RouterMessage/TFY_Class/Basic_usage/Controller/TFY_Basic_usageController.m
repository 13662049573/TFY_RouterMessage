//
//  TFY_Basic_usageController.m
//  TFY_RouterMessage
//
//  Created by 田风有 on 2020/8/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_Basic_usageController.h"

@interface TFY_Basic_usageController ()<UITableViewDataSource,UITableViewDelegate>
TFY_PROPERTY_STRONG UITableView *tableView;
TFY_PROPERTY_STRONG NSMutableArray *basicArray;
@end

@implementation TFY_Basic_usageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView tfy_AutoSize:0 top:0 right:0 bottom:0];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = UITableViewSet();
        _tableView.makeChain
        .adJustedContentIOS11()
        .showsVerticalScrollIndicator(NO)
        .showsHorizontalScrollIndicator(NO)
        .bounces(NO)
        .delegate(self)
        .dataSource(self)
        .estimatedSectionHeaderHeight(0)
        .estimatedSectionFooterHeight(0)
        .backgroundColor(UIColor.whiteColor)
        .rowHeight(50);
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.basicArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell tfy_cellFromCodeWithTableView:tableView];
    NSDictionary *dict = self.basicArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",dict[@"title"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.basicArray[indexPath.row];
    NSString *url = [NSString stringWithFormat:@"%@",dict[@"url"]];
    [self pushOpenUrl:url parameWithDict:@{@"url":url} Finishblock:^(id  _Nullable finishObject) {
        NSLog(@"回调结果:--------%@",finishObject);
    }];
}

- (NSMutableArray *)basicArray {
    if (!_basicArray) {
        _basicArray = [NSMutableArray array];
        NSDictionary *dict1 = @{@"title":@"路由的基本调用",@"url":@"tfy://basice.cn/success"};
        [_basicArray addObject:dict1];
        
        NSDictionary *dict2 = @{@"title":@"block 添加映射方法",@"url":@"tfy://basice.cn/comment"};
        [_basicArray addObject:dict2];
    }
    return _basicArray;
}
@end
