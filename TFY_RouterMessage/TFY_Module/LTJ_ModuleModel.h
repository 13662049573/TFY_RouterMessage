//
//  LTJ_ModuleModel.h
//  TFY_CodeBuilder
//
//  Created by 田风有 on 2020/08/21.
//  Copyright © 2020 TFY_CodeBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTJ_LinksModel;


@interface LTJ_ModuleModel : NSObject

/**
 * links: links 
 */
@property (nonatomic, strong) NSArray <LTJ_LinksModel *> *links;

@end



@interface LTJ_LinksModel : NSObject

/**
 * tabImg_select: tabImg_select 
 */
@property (nonatomic, copy) NSString *tabImg_select;
/**
 * tabType: 0 
 */
@property (nonatomic, assign) NSInteger tabType;
/**
 * url: url 
 */
@property (nonatomic, copy) NSString *url;
/**
 * tabImg_default: tabImg_default 
 */
@property (nonatomic, copy) NSString *tabImg_default;
/**
 * urlType: 1 
 */
@property (nonatomic, assign) NSInteger urlType;
/**
 * right: 4 
 */
@property (nonatomic, assign) NSInteger right;
/**
 * textColor:  
 */
@property (nonatomic, copy) NSString *textColor;
/**
 * tabColor_select: #000000 
 */
@property (nonatomic, copy) NSString *tabColor_select;
/**
 * title_leftUrl:  
 */
@property (nonatomic, copy) NSString *title_leftUrl;
/**
 * title_leftImgUrl: title_leftImgUrl 
 */
@property (nonatomic, copy) NSString *title_leftImgUrl;
/**
 * title_url:  
 */
@property (nonatomic, copy) NSString *title_url;
/**
 * title_rightUrl:  
 */
@property (nonatomic, copy) NSString *title_rightUrl;
/**
 * title_ImgUrl:  
 */
@property (nonatomic, copy) NSString *title_ImgUrl;
/**
 * isStatusBarDark: 0 
 */
@property (nonatomic, copy) NSString *isStatusBarDark;
/**
 * tabColor_default: #999999 
 */
@property (nonatomic, copy) NSString *tabColor_default;
/**
 * weatherAppearanceType: 1 
 */
@property (nonatomic, assign) NSInteger weatherAppearanceType;
/**
 * tabName: 新闻 
 */
@property (nonatomic, copy) NSString *tabName;
/**
 * weatherLocation: 0 
 */
@property (nonatomic, assign) NSInteger weatherLocation;
/**
 * title_bg: title_bg 
 */
@property (nonatomic, copy) NSString *title_bg;
/**
 * title_name:  
 */
@property (nonatomic, copy) NSString *title_name;
/**
 * layout: 2 
 */
@property (nonatomic, assign) NSInteger layout;
/**
 * left: 2 
 */
@property (nonatomic, assign) NSInteger left;
/**
 * rightNeedLogin: 0 
 */
@property (nonatomic, copy) NSString *rightNeedLogin;
/**
 * title_rightImgUrl:  
 */
@property (nonatomic, copy) NSString *title_rightImgUrl;
/**
 * searchType: 0 
 */
@property (nonatomic, assign) NSInteger searchType;
/**
 * center: 1 
 */
@property (nonatomic, assign) NSInteger center;
/**
 * leftNeedLogin: 0 
 */
@property (nonatomic, copy) NSString *leftNeedLogin;
/**
 * centerNeedLogin: 0 
 */
@property (nonatomic, copy) NSString *centerNeedLogin;

@end

