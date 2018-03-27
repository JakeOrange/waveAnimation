//
//  CustomToolBar.h
//  CustomToolBar
//
//  Created by 陈鹏 on 2018/3/26.
//  Copyright © 2018年 jasonchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomToolBarItem;

@interface CustomToolBar : UIView

//模仿UIToolbar可以直接设置items
@property (nonatomic, copy) NSArray <CustomToolBarItem *> *items;

//通过此参数设置按钮的title和icon颜色
@property (nonatomic, strong) UIColor *tintColor;

@end
