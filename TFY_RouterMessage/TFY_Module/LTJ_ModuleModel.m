//
//  LTJ_ModuleModel.m
//  TFY_CodeBuilder
//
//  Created by 田风有 on 2020/08/21.
//  Copyright © 2020 TFY_CodeBuilder. All rights reserved.
//

#import "LTJ_ModuleModel.h"

@implementation LTJ_ModuleModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
     return @{@"links" : LTJ_LinksModel.class,
     };
}

@end


@implementation LTJ_LinksModel


@end

