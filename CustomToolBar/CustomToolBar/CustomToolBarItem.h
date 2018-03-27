//
//  CustomToolBarItem.h
//  CustomToolBar
//
//  Created by 陈鹏 on 2018/3/27.
//  Copyright © 2018年 jasonchen. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 item的类型，囿于同时存在title和icon的处理比较复杂，只实现单独存在title或者
单独存在icon的情况，所以把item分为两种类型
 */
typedef NS_ENUM(NSInteger, CustomButtonType) {
    CustomButtonTypeTitle,
    CustomButtonTypeImage
};

@interface CustomToolBarItem : UIView

//自定义item的title，目前不能跟icon共存
@property (nonatomic, strong) NSString *title;
//自定义item的icon,目前不能跟title共存
@property (nonatomic, strong) UIImage *icon;
//用来设置title或者icon的颜色
@property (nonatomic, strong) UIColor *tintColor;

/**
 生成1个item，不需要用户去创建，直接使用

 @param type 自定义item的类型
 @return 返回一个自定义的item
 */
+ (instancetype)customButtonType:(CustomButtonType)type;

@end
