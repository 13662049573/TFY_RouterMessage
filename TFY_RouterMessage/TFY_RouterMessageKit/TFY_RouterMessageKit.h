//
//  TFY_RouterMessageKit.h
//  TFY_MessageMKit
//
//  Created by 田风有 on 2020/8/23.
//  最新版本：2.0.6

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT double TFY_RouterMessageKitVersionNumber;

FOUNDATION_EXPORT const unsigned char TFY_RouterMessageKitVersionString[];

#define TFY_RouterMessageKitRelease 0

#if TFY_RouterMessageKitRelease

#import <TFY_MessageMKit/TFY_MessageMKit.h>
#import <TFY_RouterMKit/TFY_RouterMKit.h>

#else

//消息发送机制
#import "TFY_MessageMKit.h"
//路由
#import "TFY_RouterMKit.h"

#endif
